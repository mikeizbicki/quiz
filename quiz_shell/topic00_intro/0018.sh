cd; rm -rf quiz; mkdir quiz; cd quiz
cat > example.py <<ROFL
x = 1
x += 1
print("x=", x)
ROFL
python3 example.py

