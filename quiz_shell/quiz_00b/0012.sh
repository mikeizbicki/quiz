cd; rm -rf quiz; mkdir quiz; cd quiz
cat > README <<EOF
hello world
hola_mundo
salve munde
EOF
cat README | grep -E 'm' | grep '.*e.*' | wc -l
