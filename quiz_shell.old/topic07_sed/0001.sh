cd; rm -rf quiz; mkdir quiz; cd quiz
cat > README <<EOF
hello hello hello
hola hola mundo
salve munde
EOF
cat README | sed 's/hello/goodbye/' | grep 'hello' | wc -l
