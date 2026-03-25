cd; rm -rf quiz; mkdir quiz; cd quiz
git init
echo "print('hello world')" > foo.py
echo "print('hola mundo')" > bar.py
git add foo.py
git commit -m "added foo"
git branch foo
git checkout foo
echo "print('hola otra vez')" >> foo.py
git add foo.py
git add bar.py
git commit -m "modified foo"
git checkout master
echo "print('hello again')" >> bar.py
python3 bar.py
