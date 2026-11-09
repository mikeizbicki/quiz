cd; rm -rf quiz; mkdir quiz; cd quiz
git init
mkdir -p a/b
touch a/b/c.py a/d.log
cat > .gitignore <<EOF
**/b/
*.log
EOF
git check-ignore a/b/c.py a/d.log | wc -l
