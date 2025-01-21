cd; rm -rf quiz; mkdir quiz; cd quiz
foo='hola'
cat > quiz.sh <<'EOF'
foo='hello'
if [ $foo = "hello" ]; then
    touch if
fi
EOF
sh quiz.sh
ls

