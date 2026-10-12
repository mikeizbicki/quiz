cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
print('isinstance(True, int):', isinstance(True, int))
print('type(True) is int:', type(True) is int)
print('isinstance(1, bool):', isinstance(1, bool))
print('isinstance(1, (int, str)):', isinstance(1, (int, str)))
print('isinstance(1.0, (int, str)):', isinstance(1.0, (int, str)))
EOF
python3 foo.py
