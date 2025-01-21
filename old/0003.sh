cd; rm -rf quiz; mkdir quiz; cd quiz
git init
echo "print('hello world')" > foo.py
echo "print('hola mundo')" >> bar.py
echo 'print("hola otra vez")' >> bar.py
echo "print(\"hello again\")" >> foo.py
python3 foo.py
