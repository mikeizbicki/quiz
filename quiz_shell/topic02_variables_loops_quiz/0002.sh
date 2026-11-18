cd; rm -rf quiz; mkdir quiz; cd quiz
greeting='hello world'
cat > quiz.sh <<'EOF'
echo $greeting
EOF
greeting="hola mundo" sh quiz.sh
