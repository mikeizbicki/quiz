cd; rm -rf quiz; mkdir quiz; cd quiz
touch README
mkdir test
touch test/README
cd test
echo 'API_KEY=asd' > ../.env
ls -a
