cd; rm -rf quiz; mkdir quiz; cd quiz
touch README
touch test.py
touch .hidden
mkdir test
touch test/example.py
mkdir test/test
touch test/README
touch test/test/README
cd test/../test
touch example.py
ls .. | wc -l
