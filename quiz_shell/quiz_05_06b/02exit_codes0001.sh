cd; rm -rf quiz; mkdir quiz; cd quiz
cat > logs <<EOF
INFO: blah
INFO: blah
WARNING: blah blah blah
INFO: blah
EOF
cat logs | grep 'INFO' || echo 'hello world' > foo
ls
