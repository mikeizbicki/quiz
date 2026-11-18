cd; rm -rf quiz; mkdir quiz; cd quiz
cat > quiz.sh <<EOF
echo $greeting
EOF
greeting="hola mundo" sh quiz.sh
