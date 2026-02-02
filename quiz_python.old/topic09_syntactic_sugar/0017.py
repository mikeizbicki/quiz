sentence = "This is an example sentence with a few words in it."
words = [ word.lower() for word in sentence.split() if 't' in word ]
print('len(words)=', len(words))
