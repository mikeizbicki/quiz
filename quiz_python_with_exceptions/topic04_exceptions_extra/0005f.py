tweets = [
    { 'text': 'hello', 'username': 'Trump' },
    { 'text': 'world', 'username': 'Obama' },
    { 'text': 'hola', 'username': 'Obama' },
    { 'text': 'mundo', 'name': 'Trump' },
]
greetings = ['hello', 'world']

num_greetings = 0
for i in range(len(tweets)):
    if tweets[i]['text'] in greetings:
        num_greetings += 1

print('num_greetings=', num_greetings)



