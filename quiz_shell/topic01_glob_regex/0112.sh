cd; rm -rf quiz; mkdir quiz; cd quiz
mkdir romance
mkdir germanic
echo 'hello world'      > romance/README.en # english
echo 'hola mundo'       > romance/README.es # spanish
echo 'salve munde'      > romance/README.la # latin
echo 'hallo welt'       > germanic/README.de # german
echo 'hallo wereld'     > germanic/README.nl # dutch
echo 'hej verden'       > germanic/README.da # danish
echo 'hei verden'       > germanic/README.no # norwegian
echo 'ola mundo'        > romance/README.pt # portuguese
echo 'bonjour le monde' > romance/README.fr # french
echo 'saluton mondo'    > romance/README.epo # esperanto
cat > example.py <<EOF
import glob
import re
count = 0
for filepath in glob.glob('germanic/*'):
    with open(filepath) as f:
        for line in f:
            if re.search(r'd$', line):
                count += 1
print(count)
EOF
python example.py
