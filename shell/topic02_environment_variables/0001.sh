cd; rm -rf quiz; mkdir quiz; cd quiz
export message="hello world"
cat > quiz.sh <<EOF
echo $message
EOF
sh quiz.sh
