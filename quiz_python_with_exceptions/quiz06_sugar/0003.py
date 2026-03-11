names = ['alice', 'bob', 'charlie', 'dave', 'eve']
greetings = [names[0].upper() + names[1:].lower() for name in names]
greeting = greetings[1]
print('greeting=', greeting)
