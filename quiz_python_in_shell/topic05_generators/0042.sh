cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [[1, 2], [3, 4], [5]]
try:
    print('list=', list(y for x in xs for y in x))
    print('sum=', sum(y for x in xs for y in x))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
