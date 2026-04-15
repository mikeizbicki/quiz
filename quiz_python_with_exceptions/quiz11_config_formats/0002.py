import yaml
contents='''
name: command_line
on:
  push:
    branches:
    - main
    - master
    - testing: true
jobs:
  tests:
    strategy:
      matrix:
        python:
        - 3.9
        - 3.10
        - 3.11
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up Python ${{matrix.python}}
        uses: actions/setup-python@v2
        with:
          python-version: ${{matrix.python}}
      - name: Run tests
        run:
          pip3 install .
          markdown-compiler --input_file=README.md
          markdown-compiler --input_file=README.md --add_css
'''
data = yaml.safe_load(contents)

x = len(data['jobs']['tests']['steps'][-1]['run'].split('\n'))
print('x=', x)
