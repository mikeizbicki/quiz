cd; rm -rf quiz; mkdir quiz; cd quiz
place=world
cat > README <<EOF
hello $place
hola $place
salve munde
EOF
cat README | sed 's/world/mundo/' | grep 'mundo' | wc -l
