cd; rm -rf quiz; mkdir quiz; cd quiz
cat > README <<EOF
hello world
hola world
salve munde
EOF
place=world
cat README | sed 's/$place/mundo/' | grep 'mundo' | wc -l
