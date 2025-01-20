cd; rm -rf quiz; mkdir quiz; cd quiz
cat > README <<EOF
hello world
hola mundo
salve munde
EOF
cat README | grep 'h' | grep 'a' | wc -l
