cd; rm -rf quiz; mkdir quiz; cd quiz
git init
touch hello .world
touch salve .munde
git add *
git commit -m "first commit"
git checkout -b foo
touch *
git add .
git commit -m 'second commit'
git checkout master
git checkout -b bar
echo "print('hello world')" > bar.py
git add .
git commit -m "third commit"
git checkout master
ls -a | wc -l
