cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def memoize(f, cache={}):
    def g(n):
        if n not in cache:
            cache[n] = f(n)
        return cache[n]
    return g

@memoize
def fib(n):
    if n < 2:
        return n
    return fib(n-1) + fib(n-2)
print('fib(20)=', fib(20))
EOF
python3 foo.py
