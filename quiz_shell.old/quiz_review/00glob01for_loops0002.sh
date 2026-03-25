cd; rm -rf quiz; mkdir quiz; cd quiz
touch hello world
touch 'hola mundo'
touch salve munde
for i in $(ls); do echo '$i'; done | wc -l
