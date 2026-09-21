cd; rm -rf quiz; mkdir quiz; cd quiz
world=munde
cat > README <<EOF
hello world
world hello
salve munde
EOF
cat README | sed "s/world$/mundo/" | grep 'mundo' | wc -l
