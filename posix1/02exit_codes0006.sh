cd; rm -rf quiz; mkdir quiz; cd quiz
cat > logs <<EOF
INFO: blah
INFO: blah
WARNING: blah blah blah
INFO: blah
EOF
cat > quiz.sh <<'EOF'
if cat logs | grep ERROR > /dev/null; then
    touch error
elif cat logs | grep WARNING > /dev/null; then
    touch warning
elif cat logs | grep INFO > /dev/null; then
    touch info
fi
EOF
sh quiz.sh
ls
