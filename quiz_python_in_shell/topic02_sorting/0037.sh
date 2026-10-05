cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
people = [
    {'name': 'carol', 'age': 40},
    {'name': 'alice', 'age': 30},
    {'name': 'bob',   'age': 20},
]
zs = sorted(people, key=lambda d: d['age'])
print('zs=', zs)
EOF
python3 foo.py
