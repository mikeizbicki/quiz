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
        insert(t.left, val)
    elif val > t.val:
        insert(t.right, val)
    return t

def inorder(t):
    if t is None:
        return []
    return inorder(t.left) + [t.val] + inorder(t.right)

class Tree:
    def __init__(self):
        self.root = None

    def insert(self, val):
        self.root = insert(self.root, val)

    def __getitem__(self, i):
        return inorder(self.root)[i]

try:
    t = Tree()
    for val in [5, 3, 8, 1, 4]:
        t.insert(val)
    x = t[0]
    print('x =', x)
    y = t[1]
    print('y =', y)
except IndexError:
    print('IndexError')
except TypeError:
    print('TypeError')
EOF
python3 foo.py
