cd; rm -rf quiz; mkdir quiz; cd quiz
foo='hola'
cat > quiz.sh <<'EOF'
foo='hello'
bar='salve'
if false || ([ "$bar" = "salve" ] && true); then
    touch if
else
    touch else
fi
EOF
sh quiz.sh
ls
