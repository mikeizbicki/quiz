cd; rm -rf quiz; mkdir quiz; cd quiz
export PASSWORD=hello
cat > quiz.py <<'EOF'
import os
print(os.getenv('password', 'hola'))
EOF
python3 quiz.py
