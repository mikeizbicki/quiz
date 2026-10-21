cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Node:
    def __init__(self, val, nxt=None):
        self.val = val
        self.nxt = nxt

    def __len__(self):
        if self.nxt is None:
            return 1
        return 1 + len(self.nxt)

    def __contains__(self, target):
        if self.val == target:
            return True
        if self.nxt is None:
            return False
        return target in self.nxt

    def __getitem__(self, i):
        if i == 0:
            return self.val
        if self.nxt is None:
            raise IndexError(i)
        return self.nxt[i - 1]

try:
    xs = Node(1, Node(2, Node(3, Node(4))))
    xs.nxt.nxt.nxt.nxt = xs
    v = xs[-1]
    print('v =', v)
    n = len(xs)
    print('n =', n)
except IndexError:
    print('IndexError')
except RecursionError:
    print('RecursionError')
except TypeError:
    print('TypeError')
EOF
python3 foo.py
