cd; rm -rf quiz; mkdir quiz; cd quiz
message="hello world"
cat > quiz.sh <<EOF
message="hola mundo"
EOF
sh quiz.sh
echo "$message"
