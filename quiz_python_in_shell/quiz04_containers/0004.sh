cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Node:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

def insert(t, val):
    if t is None:
        return Node(val)
    if val < t.val:
        t.right = insert(t.right, val)
    elif val > t.val:
        t.left = insert(t.left, val)
    return t

def preorder(t):
    if t is None:
        return []
    return [t.val] + preorder(t.left) + preorder(t.right)

class Tree:
    def __init__(self):
        self.root = None

    def insert(self, val):
        self.root = insert(self.root, val)

    def __getitem__(self, i):
        return preorder(self.root)[i]

try:
    t = Tree()
    for val in [10, 5, 3, 1, 4]:
        t.insert(val)
    x = t[3]
    print('x =', x)
    y = t[4]
    print('y =', y)
except IndexError:
    print('IndexError')
except TypeError:
    print('TypeError')
EOF
python3 foo.py
