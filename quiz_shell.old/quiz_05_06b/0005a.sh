cd; rm -rf quiz; mkdir quiz; cd quiz
message="hello world"
cat > quiz.py <<EOF
import os
print(os.getenv('message', 'salve munde'))
EOF
python3 quiz.py
