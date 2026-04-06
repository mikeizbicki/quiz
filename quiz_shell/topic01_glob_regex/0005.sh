cd; rm -rf quiz; mkdir quiz; cd quiz
echo 'hello world'      > README.en # english
echo 'hola mundo'       > README.es # spanish
echo 'salve munde'      > README.la # latin
echo 'hallo welt'       > README.de # german
echo 'ola mundo'        > README.pt # portuguese
echo 'bonjour le monde' > README.fr # french
echo 'saluton mondo'    > README.epo # esperanto
cat README.?? | wc -l
