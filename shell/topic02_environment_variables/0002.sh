cd; rm -rf quiz; mkdir quiz; cd quiz
cat > quiz.sh <<EOF
echo $message
EOF
message="hello world" sh quiz.sh
