cd; rm -rf quiz; mkdir quiz; cd quiz
cat > README <<EOF
hello world
world hello
salve munde
EOF
greeting=hello
cat README | sed 's/^$greeting/hola/' | grep 'hola' | wc -l
