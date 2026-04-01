cd; rm -rf quiz; mkdir quiz; cd quiz
cat > example.py <<EOF
import sys
print("sys.argv=", sys.argv)
EOF
python3 example.py hello world
