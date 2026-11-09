cd; rm -rf quiz; mkdir quiz; cd quiz
mkdir -p a/b
touch x.py a/y.py a/b/z.py
cat > example.py <<EOF
import glob
print(len(glob.glob('*.py')))
print(len(glob.glob('**/*.py', recursive=True)))
EOF
python3 example.py
