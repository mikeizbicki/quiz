cd; rm -rf quiz; mkdir quiz; cd quiz
cat > logs <<EOF
INFO: blah
INFO: blah
ERROR: blah blah blah
INFO: blah
EOF
cat > quiz.sh <<'EOF'
if cat logs | grep ERROR > /dev/null; then
    touch if
fi
EOF
sh quiz.sh
ls
