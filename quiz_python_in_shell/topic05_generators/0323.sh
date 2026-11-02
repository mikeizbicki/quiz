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

def preorder(t):
    if t is None:
        return
    yield t.val
    yield from preorder(t.left)
    yield from preorder(t.right)

class Tree:
    def __init__(self):
        self.root = None
    def insert(self, val):
        self.root = insert(self.root, val)
    def __iter__(self):
        return inorder(self.root)
try:
    t = Tree()
    for v in [5, 4, 3, 2, 1]:
        t.insert(v)
    print('inorder=', list(inorder(t.root)))
    print('preorder=', list(preorder(t.root)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
