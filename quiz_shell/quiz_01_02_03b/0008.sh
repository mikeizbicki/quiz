cd; rm -rf quiz; mkdir quiz; cd quiz
foo='$(echo "$(echo echo)")'
touch "$foo"
ls | wc -l
