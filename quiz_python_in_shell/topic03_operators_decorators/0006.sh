cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def memoize(f, cache={}):
    def g(n):
        if n not in cache:
            cache[n] = f(n)
        return cache[n]
    return g

@memoize
def f(n):
    return n * n

@memoize
def g(n):
    return n + 1

print('f(5)=', f(5))
print('g(5)=', g(5))
EOF
python3 foo.py
