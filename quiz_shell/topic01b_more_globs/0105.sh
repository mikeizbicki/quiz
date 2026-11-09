cd; rm -rf quiz; mkdir quiz; cd quiz
echo 'hello world' > README.md
echo 'hola mundo' > README.txt
echo 'salve munde' > README
cat > example.py <<EOF
import glob
import itertools
it = glob.iglob('README*')
print(len(list(itertools.islice(it, 2))))
print(len(glob.glob('README*')))
EOF
python3 example.py
