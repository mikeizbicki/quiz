cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        return (self.x, self.y) == (other.x, other.y)
    def __hash__(self):
        return hash((self.x, self.y))
class B(A):
    def __eq__(self, other):
        return (self.x, self.y) == (other.x, other.y)
print('B.__hash__ is None:', B.__hash__ is None)
EOF
python3 foo.py
