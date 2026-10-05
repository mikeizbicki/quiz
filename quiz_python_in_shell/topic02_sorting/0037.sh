cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
people = [
    {'name': 'carol', 'age': 40},
    {'name': 'alice', 'age': 30},
    {'name': 'bob',   'age': 20},
]
print('sorted(people, key=lambda d: d["age"])=',
      sorted(people, key=lambda d: d['age']))
EOF
python3 foo.py
