import yaml
contents='''
%YAML 1.2
---
YAML: YAML Ain't Markup Language™

What It Is:
  YAML is a human-friendly data serialization
  language for all programming languages.

YAML Specifications:
- YAML 1.2:
  - Revision 1.2.2  # Oct  1, 2021  (About this version)
  - Revision 1.2.1  # Oct  1, 2009
  - Revision 1.2.0  # Jul 21, 2009
- YAML 1.1          # Jan 18, 2005
- YAML 1.0          # Jan 29, 2004

YAML Web Sites:
  The YAML Company:   yaml.com          # We Support YAML!
  YAML Playground:    play.yaml.com     # Try many YAMLs!
  YAML Information:   yaml.info         # Learn about YAML!
  YAML Test Matrix:   matrix.yaml.info  # Compare YAMLs!
  Program in YAML:    yamlscript.org    # Code is Data!

YAML Matrix Chat:  '#chat:yaml.io'
YAML IRC Channel:  libera.chat#yaml

YAML on GitHub:    # github.com/yaml/
  YAML Test Suite:    yaml-test-suite/
  YAML Specs:         yaml-spec/
  YAML 1.2 Grammar:   yaml-grammar/
  YAML Test Suite:    yaml-test-suite/
'''
data = yaml.safe_load(contents)

a = len(data['YAML Specifications'])
print('a=', a)

b = len(data['YAML Specifications']['YAML 1.2'])
print('b=', b)

c = len(data['YAML Specifications'][0])
print('c=', c)

d = len(data['YAML Specifications'][0]['YAML 1.2'])
print('d=', d)

e = len(data['YAML on GitHub'][0])
print('e=', e)

f = len(data['YAML on GitHub']['YAML Specs'])
print('f=', f)

g = data['YAML on GitHub']['YAML Specs'][0]
print('g=', g)

h = data['What It Is'].split('\n')
print('h=', h)
