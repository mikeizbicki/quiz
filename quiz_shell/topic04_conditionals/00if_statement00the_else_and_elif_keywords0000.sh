cd; rm -rf quiz; mkdir quiz; cd quiz
foo='hola'
cat > quiz.sh <<'EOF'
foo='hello world'
if [ $foo = "hello" ]; then
    touch if
else
    touch else
fi
EOF
sh quiz.sh
ls
