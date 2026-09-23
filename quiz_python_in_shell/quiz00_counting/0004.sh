cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def reverse_list(xs):
    ys = xs[:]
    for i in range(len(ys)):
        xs[i] = ys[-i-1]
    return ys
xs = [1, 2, 3]
ys = reverse_list(xs)
print('xs=', xs)
print('ys=', ys)
EOF
python3 foo.py
