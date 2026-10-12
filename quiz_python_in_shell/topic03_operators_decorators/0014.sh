cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y
    def __hash__(self):
        return hash((self.x, self.y))
print('Vec(1, 2) == Vec(1.0, 2.0):', Vec(1, 2) == Vec(1.0, 2.0))
print('Vec(1, 2) == Vec(True, 2):', Vec(1, 2) == Vec(True, 2))
print('len({Vec(1, 2), Vec(1.0, 2.0), Vec(True, 2)}):', len({Vec(1, 2), Vec(1.0, 2.0), Vec(True, 2)}))
EOF
python3 foo.py
