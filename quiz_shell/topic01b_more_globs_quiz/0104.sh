cd; rm -rf quiz; mkdir quiz; cd quiz
echo 'hello world'      > README.en
echo 'hola mundo'       > README.es
echo 'salve munde'      > README.la
echo 'hallo welt'       > README.de
echo 'ola mundo'        > README.pt
echo 'bonjour le monde' > README.fr
echo 'saluton mondo'    > README.epo
cat > example.py <<EOF
import glob
import itertools
it = glob.iglob('README.[elf]?')
print(len(list(itertools.islice(it, 1))))
print(len(list(it)))
EOF
python3 example.py
