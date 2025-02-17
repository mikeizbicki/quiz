cd; rm -rf quiz; mkdir quiz; cd quiz
git init
echo "print('hello world')" >> foo.py
echo 'print("hola mundo")' >> bar.py
git add bar.py
git commit -m "first commit"
git branch bar
git checkout bar
echo "print('hello again')" >> bar.py
git add foo.py
git add bar.py
git commit -m "second commit"
git checkout master
echo "print('hola otra vez')" > bar.py
python3 bar.py
