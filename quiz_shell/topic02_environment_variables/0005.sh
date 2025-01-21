cd; rm -rf quiz; mkdir quiz; cd quiz
cat > quiz.py <<'EOF'
import os
print(os.getenv('message', 'hola mundo'))
EOF
message="hello world" python3 quiz.py
