cd; rm -rf quiz; mkdir quiz; cd quiz
cat > paths <<EOF
/usr/local/bin:/usr/local/lib
/usr/bin:/usr/lib
EOF
cat paths | sed 's;/usr/local;/opt;' | grep '/usr/local' | wc -l
