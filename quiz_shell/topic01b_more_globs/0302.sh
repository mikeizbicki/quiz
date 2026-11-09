cd; rm -rf quiz; mkdir quiz; cd quiz
git init
mkdir build
touch build/keep.py
cat > .gitignore <<EOF
build/
!build/keep.py
EOF
git add -A
git status --porcelain
