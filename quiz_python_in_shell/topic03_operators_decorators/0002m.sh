cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
print('isinstance(KeyError(), LookupError):', isinstance(KeyError(), LookupError))
print('isinstance(IndexError(), LookupError):', isinstance(IndexError(), LookupError))
print('isinstance(KeyError(), IndexError):', isinstance(KeyError(), IndexError))
print('issubclass(RecursionError, RuntimeError):', issubclass(RecursionError, RuntimeError))
EOF
python3 foo.py
