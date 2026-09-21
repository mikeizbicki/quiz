cd; rm -rf quiz; mkdir quiz; cd quiz
cat > README <<EOF
hello world
world hello
salve munde
EOF
world=munde
cat README | sed "s/world$/mundo/" | grep 'mundo' | wc -l
