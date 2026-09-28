cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def is_even(n):
    if n == 0:
        return True
    return is_odd(n - 1)

def is_odd(n):
    return not is_even(n)
try:
    print('is_even(5)=',is_even(5))
    print('is_odd(5)=',is_odd(5))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
