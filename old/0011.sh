cd; rm -rf quiz; mkdir quiz; cd quiz
git init
mkdir foo
echo "print('hello world')" >> foo.py
echo "print('hola mundo')" >> foo/foo.py
echo 'print("hola otra vez")' >> foo/bar.py
echo "print(\"hello again\")" >> foo/.foo.py
python3 foo/foo.py
