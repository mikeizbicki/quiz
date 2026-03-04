sentence = "This is an example sentence with a few words in it."
small_words = [ word.lower() for word in sentence if len(word) <= 2]
print('len(small_words)=', len(small_words))
