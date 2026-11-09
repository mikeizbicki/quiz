cd; rm -rf quiz; mkdir quiz; cd quiz
mkdir -p a/b
echo 'hello world' > README.md
echo 'hola mundo' > a/README.es
echo 'hallo welt' > a/b/README.de
cat > example.py <<EOF
import glob
pat = '**/README.*'
print(len(glob.glob(pat)))
print(len(glob.glob(pat, recursive=True)))
EOF
python3 example.py
