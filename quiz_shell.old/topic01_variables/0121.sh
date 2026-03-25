cd; rm -rf quiz; mkdir quiz; cd quiz
var=$(cat <<EOF
hello world
hola mundo
salve munde
EOF
)
echo "$var" | wc -l
