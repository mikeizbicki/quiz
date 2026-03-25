cd; rm -rf quiz; mkdir quiz; cd quiz
git init
echo evil > -a
touch hola mundo
touch test/'hello world'
touch test/'.salve .munde'
cd test
git add .
git commit -m 'first commit'
git checkout -b foo
git add ..
git commit -m 'second commit'
cd $HOME/quiz
git checkout master
ls *
