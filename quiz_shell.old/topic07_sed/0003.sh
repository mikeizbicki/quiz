cd; rm -rf quiz; mkdir quiz; cd quiz
cat > README <<EOF
hello hello hello
hola hola mundo
salve munde
EOF
cat README | sed 's/hola/hello/' | sed 's/hello/goodbye/g' | grep 'hola' | wc -l
