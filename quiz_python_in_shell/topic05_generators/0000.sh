cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def g():
    yield 1
    yield 2
    yield 3
try:
    result = g()
    x = next(result)
    x = next(result)
    print('x=', x)
    result = g()
    print('list=', list(result))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
