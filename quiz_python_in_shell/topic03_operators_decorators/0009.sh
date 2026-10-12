cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import functools
@functools.lru_cache
def f(n):
    return n * n
f(3)
f(3)
f(4)
info = f.cache_info()
print('hits=', info.hits)
print('misses=', info.misses)
EOF
python3 foo.py
