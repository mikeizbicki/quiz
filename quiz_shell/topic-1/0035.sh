cd; rm -rf quiz; mkdir quiz; cd quiz
git init
mkdir master
echo "print('hello world')" > master/foo.py
echo "print('hola mundo')" > foo.py
git add master
git commit -m "added master"
git branch foo
git checkout foo
echo "print('hola mundo')" >> foo.py
git add foo.py
git commit -m "modified foo"
git checkout master
ls
