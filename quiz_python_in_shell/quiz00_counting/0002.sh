cd; rm -rf quiz; mkdir quiz; cd quiz
N=2
M=4
O=8
cat > foo.py <<EOF
count = 0
for i in range($N + $M):
    count += 1
    for i in range($N):
        count += 1
for j in range($M + $O):
    count += 1
print('count=', count)
EOF
python3 foo.py
