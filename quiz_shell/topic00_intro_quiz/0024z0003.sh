cd; rm -rf quiz; mkdir quiz; cd quiz
cat > example.py <<EOF
import sys
num_args = len(sys.argv)
print("num_args=", num_args)
EOF
python3 example.py 'hello world' hola mundo "salve munde"
