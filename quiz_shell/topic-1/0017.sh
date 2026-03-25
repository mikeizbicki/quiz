cd; rm -rf quiz; mkdir quiz; cd quiz
cat > example.py <<EOF
x = 1
x += 1
print("x=", x)
EOF
python3 example.py
