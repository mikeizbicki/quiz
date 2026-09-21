cd; rm -rf quiz; mkdir quiz; cd quiz
cat > paths <<EOF
/usr/local/bin/python3
/usr/local/lib/python3
/usr/bin/sed
EOF
cat paths | sed 's/\/usr\/local/\/opt/' | grep '/opt' | wc -l
