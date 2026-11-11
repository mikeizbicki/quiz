cd; rm -rf quiz; mkdir quiz; cd quiz
mkdir romance germanic
echo 'hello world'      > README.en
echo 'hola mundo'       > romance/README.es
echo 'salve munde'      > romance/README.la
echo 'hallo welt'       > germanic/README.de
echo 'ola mundo'        > germanic/README.pt
cat > example.py <<EOF
import glob
pat = '**/README.[elf]?'
print(len(glob.glob(pat)))
print(len(glob.glob(pat, recursive=True)))
EOF
python3 example.py
