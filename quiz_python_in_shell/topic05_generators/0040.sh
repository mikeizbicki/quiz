cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [1, 2, 3, 4]
try:
    print('list(xx)=', list(x * x for x in xs))
    print('sum(xx)=', sum(x * x for x in xs))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
