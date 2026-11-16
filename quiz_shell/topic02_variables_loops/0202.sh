cd; rm -rf quiz; mkdir quiz; cd quiz
place=world
var=$(cat <<'EOF'
hello $place
hola $place
salve $place
EOF
)
echo "$var" | grep 'e' | wc -l
