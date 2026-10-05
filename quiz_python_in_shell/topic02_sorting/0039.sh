cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import operator
xs = [('b', 2), ('a', 3), ('c', 1), ('a', 1), ('b', 1)]
print('sorted(xs, key=operator.itemgetter(1))=',
      sorted(xs, key=operator.itemgetter(1)))
print('sorted(xs, key=operator.itemgetter(1, 0))=',
      sorted(xs, key=operator.itemgetter(1, 0)))
EOF
python3 foo.py
