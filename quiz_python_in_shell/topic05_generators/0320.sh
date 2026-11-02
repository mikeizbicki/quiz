cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Node:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

def insert(root, val):
    if root is None:
        return Node(val)
    if val < root.val:
        root.left = insert(root.left, val)
    elif val > root.val:
        root.right = insert(root.right, val)
    return root

def inorder(t):
    if t is None:
        return
    yield from inorder(t.left)
    yield t.val
    yield from inorder(t.right)

class Tree:
    def __init__(self):
        self.root = None
    def insert(self, val):
        self.root = insert(self.root, val)
    def __iter__(self):
        return inorder(self.root)
try:
    t = Tree()
    for v in [5, 3, 8, 1, 4]:
        t.insert(v)
    xs = list(t)
    print('first3=', xs[:3])
    print('last2=', xs[-2:])
except TypeError:
    print('TypeError')
EOF
python3 foo.py
