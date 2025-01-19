#!/bin/python3
'''
Convert a folder into a pdf document.
'''

import argparse
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('dir')
args = parser.parse_args()

import os
os.chdir(args.dir)

import logging
logging.basicConfig(
    format='%(asctime)s - %(levelname)s - %(message)s',
    level=logging.INFO,
    datefmt='%Y-%m-%d %H:%M:%S'
)

template_path = 'template.tex'
logging.info(f"template_path={template_path}")
with open(template_path) as fin:
    template = fin.read()
    template_footer = r'\end{document}'
    template_header = template.split(template_footer)[0]

prompt_path = 'prompt'
logging.info(f"prompt_path={prompt_path}")
with open(prompt_path) as fin:
    prompt = fin.read()

from collections import Counter
all_llms = set()
total_problems = 0
passed_problems = Counter()

import glob
paths = glob.glob("./*.??")
last_section_pattern = None
content = []
for path in sorted(paths):
    total_problems += 1
    logging.info(f'path={path}')
    
    content.append(r'\noindent\vspace{0.1in}\begin{minipage}{\textwidth}')

    # append section information if necessary
    filename = os.path.basename(path)
    filename.split('.')[0]
    import re
    pattern = re.match(r'^((?:\d+[a-zA-Z_]+)*)', filename)
    section_pattern = pattern.group(1)
    if last_section_pattern != section_pattern:
        last_section_pattern = section_pattern
        text_parts = re.findall(r'\d+([a-zA-Z_]+)', filename)
        section_name = text_parts[-1]
        section_str = '\\' + 'sub'*(len(text_parts)-1) + 'section{' + section_name.replace('_', ' ').title() + '}'
        logging.info(f"section_str={section_str}")
        content.append(section_str)

    # append problem information
    with open(path) as fin:
        lines = []

        # process md (i.e. notes)
        if path.split('.')[-1] == 'md':
            content.append(r'''
\begin{note}
''' + fin.read() + r'''
\end{note}
''')

        # process scripts (i.e. problems)
        if path.split('.')[-1] == 'sh':
            in_heredoc = False
            for line in fin:
                line = line[:-1]
                if not in_heredoc:
                    line = '$ ' + line
                lines.append(line)
                if '<<' in line:
                    in_heredoc = True
                if line == 'EOF':
                    in_heredoc = False
                # FIXME:
                # this is a very janky way for detecting heredoc
                # and won't generalize to all problems;
                # the most correct thing to do is, unfortunately,
                # to parse the document with sh somehow

            session_out = '\n'.join(lines)
            problem = r'''
\begin{problem}
''' + prompt + r'''
\end{problem}
\begin{lstlisting}
''' + session_out + r'''
\end{lstlisting}
'''
            content.append(problem)

            # compute LLM scores
            pass_llms = []
            fail_llms = []
            outputs_path = os.path.dirname(path) + '/.outputs/' + os.path.basename(path)
            logging.debug(f"outputs_path={outputs_path}")
            def normalize_text(text):
                return ' '.join(sorted(text.split()))
            with open(outputs_path) as fin:
                ground_truth = normalize_text(fin.read())
                logging.debug(f"ground_truth={ground_truth}")
            for llmpath in sorted(glob.glob(outputs_path + '.*')):
                llm = llmpath.split(outputs_path)[-1][1:]
                logging.debug(f"llmpath={llmpath}; llm={llm}")
                with open(llmpath) as fin:
                    llm_output = normalize_text(fin.read())
                    if llm_output == ground_truth:
                        pass_llms.append(llm)
                        passed_problems[llm] += 1
                    else:
                        fail_llms.append(llm)
                        passed_problems[llm] += 0
                        logging.debug(f"llm_output, ground_truth={llm_output, ground_truth}")
            def latexify(xs):
                return [r'{\lstinline$' + x + '$}' for x in xs]
            #content.append(r'path: \lstinline{' + path + '}')
            if False:
                content.append(r'''
\noindent
\begin{tabular}{p{1.0in}L{5in}}
Passing LLMs: & ''' + ', '.join(latexify(pass_llms)) + r''' \\
Failing LLMs: & ''' + ', '.join(latexify(fail_llms)) + r''' \\
\end{tabular}
''')
            content.append(f'Fraction of LLMs with correct answer: {len(pass_llms)} / {len(pass_llms) + len(fail_llms)} = {len(pass_llms) / (len(pass_llms) + len(fail_llms)):0.02f}')

            # look for any llms that we've seen before but were not in the current set of test cases;
            # this can happen if somehow the llm didn't get run on the current test case
            for llm in all_llms:
                if llm not in pass_llms and llm not in fail_llms:
                    logging.warning(f'missing llm: {llm}')
                    #content.append(f'missing llm: {llm}')
            all_llms |= set(pass_llms)
            all_llms |= set(fail_llms)

    content.append(r'\end{minipage}')

# generate plot of scores
import matplotlib.pyplot as plt
percentages = {k: (v / total_problems) * 100 for k, v in passed_problems.items()}
import pprint
pprint.pprint(percentages)
percentages = sorted(percentages.items())
percentages_keys = [k for (k,v) in percentages]
percentages_values = [v for (k,v) in percentages]
plt.barh(percentages_keys, percentages_values)
for i, v in enumerate(percentages_values):
    plt.text(v, i, f' {v:2.0f}', va='center', ha='left')
plt.xlabel('Score (%)')
plt.xlim(0, 100)
plt.tight_layout()
width = 6
aspect_ratio = plt.gcf().get_size_inches()[1]/plt.gcf().get_size_inches()[0]
#plt.figure(figsize=(width, width*aspect_ratio))
plt.savefig('llm_scores.pdf')
content.append(r'''
\section*{LLM Model Performance}
\includegraphics{llm_scores}
''')

output_tex_path = 'quiz.tex'
logging.info(f"output_tex_path={output_tex_path}")
with open(output_tex_path, 'w') as fout:
    tex = template_header + '\n'.join(content) + template_footer
    fout.write(tex)

import subprocess
try:
    # NOTE:
    # pdflatex with -interaction=nonstopmode prevents hanging on errors
    result = subprocess.run(
        ['pdflatex', '-interaction=nonstopmode', output_tex_path],
        capture_output=True,
        text=True,
        check=True
    )
except subprocess.CalledProcessError as e:
    logging.error(f"e.stdout={e.stdout}")
    logging.error(f"e.stderr={e.stderr}")
    import sys
    sys.exit(1)
