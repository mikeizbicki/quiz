cd; rm -rf quiz; mkdir quiz; cd quiz
for file in 'a b' 'c d' 'e f'; do touch $file; done
ls | wc -l
