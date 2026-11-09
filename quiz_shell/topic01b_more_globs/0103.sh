cd; rm -rf quiz; mkdir quiz; cd quiz
echo 'hello world' > README.md
echo 'hola mundo' > README.txt
echo 'salve munde' > README
cat > example.py <<EOF
import glob
it = glob.iglob('README.*')
print(len(list(it)))
print(len(list(it)))
EOF
python3 example.py
