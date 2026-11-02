cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def g():
    yield 'a'
    yield 'b'
    yield 'c'
try:
    it = g()
    print('enum=', list(enumerate(it)))
    print('again=', list(enumerate(it)))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
