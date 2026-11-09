cd; rm -rf quiz; mkdir quiz; cd quiz
git init
mkdir build
touch a.py b.log build/c.py
cat > .gitignore <<EOF
*.log
build/
EOF
git add -A
git status --porcelain
