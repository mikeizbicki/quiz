cd; rm -rf quiz; mkdir quiz; cd quiz
echo 'hello world' >> README
echo 'hola mundo' > README
echo 'salve munde' >> README
cat README | grep 'h|a' | wc -l
