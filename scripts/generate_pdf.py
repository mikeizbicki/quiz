#!/bin/python3
'''
Convert a folder into a pdf document.
'''

def extract_exception(text):
    """
    Finds and returns the full alphanumeric substring containing 'Error',
    otherwise returns the original text.

    >>> extract_exception("Traceback: ValueError")
    'ValueError'
    >>> extract_exception("Caught exception: TypeError")
    'TypeError'
    >>> extract_exception("No errors here, just a KeyError")
    'KeyError'
    >>> extract_exception("RuntimeError occurred")
    'RuntimeError'
    >>> extract_exception("No exceptions raised")
    'No exceptions raised'
    >>> extract_exception("Failed with SyntaxError")
    'SyntaxError'
    """
    import re

    # Regular expression pattern to match alphanumeric strings
    pattern = r'\b\w*Error\w*\b'

    # Find all matches in the text
    matches = re.findall(pattern, text)

    # If matches are found, return the first match
    if matches:
        return matches[0]
    else:
        return text

def remove_code_blocks(text: str) -> str:
    """Remove triple backtick markers while preserving code block contents.

    >>> text = '''Hello
    ... ```python
    ... def test():
    ...     pass
    ... ```
    ... World'''
    >>> print(remove_code_blocks(text))
    Hello
    def test():
        pass
    World

    With inline code and multiple blocks:
    >>> code = '''`var` = 5
    ... ```python
    ... x = 1
    ... ```
    ... normal text
    ... ```
    ... y = 2
    ... ```'''
    >>> print(remove_code_blocks(code))
    `var` = 5
    x = 1
    normal text
    y = 2
    """
    return '\n'.join(line for line in text.splitlines()
                    if not line.strip().startswith('```'))

def normalize_text(text):
    text = remove_code_blocks(text)
    text = extract_exception(text)
    return text

################################################################################
# main code below
################################################################################

if __name__ == '__main__':

    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('quizpath')
    parser.add_argument('--nographs', action='store_true')
    parser.add_argument('--verbose', action='store_true')
    args = parser.parse_args()

    import logging
    log_level = logging.INFO
    if args.verbose:
        log_level = logging.DEBUG
    logging.basicConfig(
        format='%(asctime)s - %(levelname)s - %(message)s',
        level=log_level,
        datefmt='%Y-%m-%d %H:%M:%S'
    )

    import os
    import subprocess
    #shell_path = os.path.dirname(__file__) + '/run_models.sh'
    #try:
        #subprocess.check_call(['sh', shell_path, args.quizpath])
    #except subprocess.CalledProcessError as e:
        #raise

    import os
    newpwd = args.quizpath + '/..'
    os.chdir(newpwd)
    logging.info(f"os.getcwd()={os.getcwd()}")
    if args.quizpath[-1] == '/':
        args.quizpath = args.quizpath[:-1]
    topicpath = os.path.basename(args.quizpath)
    logging.info(f"topicpath={topicpath}")

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
    prompt_styles=['1shot'] #, 're2', 'cot']
    passed_problems = {}
    for prompt_style in prompt_styles:
        passed_problems[prompt_style] = Counter()


    import glob
    globpattern = topicpath + "/*"
    logging.info(f"globpattern={globpattern}")
    paths = glob.glob(globpattern)
    last_section_pattern = None
    content = []
    inside_minipage = False
    answer_key = []
    for path in sorted(paths):
        logging.info(f'path={path}')
        
        if not inside_minipage:
            content.append(r'\noindent\vspace{0.1in}\begin{minipage}{\textwidth}')
            inside_minipage = True

        # append problem information
        with open(path) as fin:
            lines = []
            extension = path.split('.')[-1]

            # process raw sections
            end_minipage = True
            if extension == 'raw':
                content.append(fin.read())
                end_minipage = False

            # process scripts (i.e. problems)
            else:
                if extension == 'sh':
                    shellprompt = '$'
                elif extension == 'py':
                    shellprompt = ''
                total_problems += 1
                in_heredoc = False
                for line in fin:
                    line = line[:-1]
                    if line.strip() == '':
                        continue
                    if not in_heredoc:
                        line = shellprompt + ' ' + line
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
                with open(outputs_path) as fin:
                    ground_truth = normalize_text(fin.read())
                    logging.debug(f"ground_truth={ground_truth}")
                    answer_key.append(ground_truth)
                for prompt_style in prompt_styles:
                    logging.debug(f"prompt_style={prompt_style}")
                    for llmpath in sorted(glob.glob(outputs_path + '.' + prompt_style + '.*')):
                        llm = llmpath.split(outputs_path + '.' + prompt_style)[-1][1:]
                        logging.debug(f"llmpath={llmpath}; llm={llm}")
                        with open(llmpath) as fin:
                            llm_output_raw = fin.read()
                            llm_output = normalize_text(llm_output_raw)
                            llm_output_cot1 = normalize_text(llm_output_raw.split('ANSWER:')[-1])
                            llm_output_cot2 = normalize_text(llm_output_raw.split('\n')[-1])
                            #if llm_output == ground_truth or llm_output_cot1 == ground_truth or llm_output_cot2 == ground_truth:
                            if llm_output == ground_truth or llm_output_cot1 == ground_truth or llm_output_cot2 == ground_truth:
                                pass_llms.append(llm)
                                passed_problems[prompt_style][llm] += 1
                            else:
                                fail_llms.append(llm)
                                passed_problems[prompt_style][llm] += 0
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
                content.append(r'\vspace{0.5in}')

                # look for any llms that we've seen before but were not in the current set of test cases;
                # this can happen if somehow the llm didn't get run on the current test case
                for llm in all_llms:
                    if llm not in pass_llms and llm not in fail_llms:
                        logging.warning(f'missing llm: {llm}')
                        #content.append(f'missing llm: {llm}')
                all_llms |= set(pass_llms)
                all_llms |= set(fail_llms)

        if end_minipage:
            content.append(r'\end{minipage}')
            inside_minipage = False

    import tempfile
    tempdir = tempfile.TemporaryDirectory()
    prev_cwd = os.getcwd()
    os.chdir(tempdir.name)
    logging.info(f"os.getcwd()={os.getcwd()}")

# generate plot of scores
    if not args.nographs:
        import matplotlib.pyplot as plt
        percentages = {k: (v / total_problems) * 100 for k, v in passed_problems['1shot'].items()}
        import pprint
        pprint.pprint(percentages)
        percentages = sorted(percentages.items())
        percentages_keys = [k for (k,v) in percentages]
        percentages_values = [v for (k,v) in percentages]
        plt.barh(percentages_keys, percentages_values)
        for i, v in enumerate(percentages_values):
            plt.text(v, i, f' {v:2.0f}', va='center', ha='left')

        if False:
            all_categories = set()
            for key in ['re2', '1shot', 'cot']:
                all_categories.update(passed_problems[key].keys())
            all_categories = sorted(all_categories)
            bar_width = 0.25
            import numpy as np
            y_pos = np.arange(len(all_categories))
            for idx, key in enumerate(prompt_styles):
                percentages = {k: (v / total_problems) * 100 for k, v in passed_problems[key].items()}
                values = [percentages.get(cat, 0) for cat in all_categories]
                # Plot bars with offset
                offset = (idx - 1) * bar_width
                bars = plt.barh(y_pos + offset, values,
                                bar_width,
                                #color=colors[key],
                                label=key)
                # Add text annotations
                for i, v in enumerate(values):
                    if v > 0:  # Only add text for non-zero values
                        plt.text(v, i + offset, f' {v:2.0f}', va='center', ha='left')
            plt.yticks(y_pos, all_categories)

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

    content.append('\section*{Answer Key}')
    for i, answer in enumerate(answer_key):
        problem = r'''
\noindent
\textbf{problem ''' + str(i+1) + r'''}
\begin{lstlisting}
''' + answer + r'''
\end{lstlisting}
'''
        content.append(problem)

    logging.info(f"os.getcwd()={os.getcwd()}")
    output_tex_path = topicpath + '.tex'
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
        #tempdir.cleanup()
        import sys
        sys.exit(1)

    import shutil
    shutil.copy(topicpath + '.pdf', prev_cwd)
    tempdir.cleanup()
