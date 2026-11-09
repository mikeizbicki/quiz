cd; rm -rf quiz; mkdir quiz; cd quiz
touch a.py b.py c.py
cat > example.py <<EOF
import glob
import itertools
it = glob.iglob('*.py')
print(len(list(itertools.islice(it, 2))))
print(len(list(it)))
EOF
python3 example.py
