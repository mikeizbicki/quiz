cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __repr__(self):
        return 'R'
    def __str__(self):
        return 'S'
v = Vec(1, 2)
print(v)
print([v])
EOF
python3 foo.py
