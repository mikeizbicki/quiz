cd; rm -rf quiz; mkdir quiz; cd quiz
foo='hola'
cat > quiz.sh <<EOF
foo='hello'
if [ "$foo" = "hello" ]; then
    touch if
elif [ "$foo" = "hola" ]; then
    touch elif
else
    touch else
fi
EOF
sh quiz.sh
ls
