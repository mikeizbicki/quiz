cd; rm -rf quiz; mkdir quiz; cd quiz
echo 'hello world' > README.md
echo 'hola mundo' > README.txt
echo 'salve munde' > README
cat > example.py <<EOF
import glob
paths = glob.glob('*.*')
print(len(paths))
EOF
python3 example.py
