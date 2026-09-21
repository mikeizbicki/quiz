cd; rm -rf quiz; mkdir quiz; cd quiz
greeting=hello
cat > README <<EOF
hello world
world hello
salve munde
EOF
cat README | sed 's/^$greeting/hola/' | grep 'hola' | wc -l
