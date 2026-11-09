cd; rm -rf quiz; mkdir quiz; cd quiz
touch a.py b.py c.txt
cat > example.py <<EOF
import glob
it = glob.iglob('*.py')
print(len(list(it)))
print(len(list(it)))
EOF
python3 example.py
