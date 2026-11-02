cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [1, 2, 3, 4]
n = 2
gen = (n * x for x in xs)
n = 3
try:
    print('n now=', n)
    print('list(gen)=', list(gen))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
