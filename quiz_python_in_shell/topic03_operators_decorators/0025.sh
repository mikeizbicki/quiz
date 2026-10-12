cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [1, 2, 3]
ys = xs
xs += [4]
print('xs=', xs)
print('ys=', ys)
zs = (1, 2, 3)
ws = zs
zs += (4,)
print('zs=', zs)
print('ws=', ws)
EOF
python3 foo.py
