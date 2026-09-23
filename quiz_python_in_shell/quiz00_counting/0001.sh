cd; rm -rf quiz; mkdir quiz; cd quiz
N=8
cat > foo.py <<EOF
count = 0
for i in range($N):
    for j in range($N):
        count += 1
for i in range($N):
    count += 1
    count += 1
count += 1
print('count=', count)
EOF
python3 foo.py
