cd; rm -rf quiz; mkdir quiz; cd quiz
cat > logs <<EOF
INFO: blah
INFO: blah
ERROR: blah blah blah
INFO: blah
EOF
cat logs | grep 'ERROR' || echo 'hello world' > foo
ls
