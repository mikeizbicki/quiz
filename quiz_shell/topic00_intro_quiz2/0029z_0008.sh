cd; rm -rf quiz; mkdir quiz; cd quiz
touch README
touch test.py
mkdir test
mkdir test/test
touch test/README
touch test/test/README
cd test/../test
ls .. | wc -l
