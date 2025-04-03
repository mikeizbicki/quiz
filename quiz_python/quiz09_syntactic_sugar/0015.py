sentence = "This is an example sentence with a few words in it."
words = [word.upper() for word in sentence.split(' ') if len(word) > 2] 
print('len(words)=', len(words))
