cd; rm -rf quiz; mkdir quiz; cd quiz
mkdir romance
mkdir germanic
echo 'hola mundo' > romance/README.es
echo 'hallo welt' > germanic/README.de
echo 'hei verden' > germanic/README.no
cat */README.?? | grep 'o' | wc -l
