cd; rm -rf quiz; mkdir quiz; cd quiz
git init
echo "print('hello world')" > foo.py
git add foo.py
git commit -m "added foo"
git branch foo
git checkout foo
echo "print('hola mundo')" >> foo.py
git add foo.py
git commit -m "modified foo"
git checkout master
python3 foo.py
