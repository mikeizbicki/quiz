cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def g():
    yield 1
    yield 2
    yield 3
    yield 4
try:
    it = g()
    print('sum(it)=', sum(it))
    print('next(it)=', next(it))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
