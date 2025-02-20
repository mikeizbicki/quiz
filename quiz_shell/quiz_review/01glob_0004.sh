cd; rm -rf quiz; mkdir quiz; cd quiz
git init
mkdir test
touch 'test/hola mundo'
touch test/hello world
touch test/'.salve .munde'
cd test
for i in *; do git add $i; done
git commit -m 'first commit'
git checkout -b foo
git add .
git commit -m 'second commit'
git checkout master
ls -a
