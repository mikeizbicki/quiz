cd; rm -rf quiz; mkdir quiz; cd quiz
export password="hello world"
cat > quiz.py <<'EOF'
import os
print(os.getenv('password', 'hola mundo'))
EOF
python3 quiz.py
