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

import glob
paths = glob.glob("./*.sh")
last_section_pattern = None
content = []
for path in sorted(paths):
    logging.info(f'path={path}')

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
        session = fin.read().strip()
    session_out = ['$ ' + line for line in session.split('\n')]
    session_out = '\n'.join(session_out)
    problem = r'''
\begin{samepage}
\begin{problem}
''' + prompt + r'''
\end{problem}
\begin{lstlisting}
''' + session_out + r'''
\end{lstlisting}
\end{samepage}
'''
    content.append(problem)

output_tex_path = 'quiz.tex'
logging.info(f"output_tex_path={output_tex_path}")
with open(output_tex_path, 'w') as fout:
    tex = template_header + '\n'.join(content) + template_footer
    fout.write(tex)

import subprocess
try:
    # Run pdflatex with -interaction=nonstopmode to prevent hanging on errors
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
