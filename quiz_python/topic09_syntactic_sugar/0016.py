names = ['alice', 'bob', 'charlie', 'dave', 'eve']
greetings = [ name[0].upper() + name[1:].lower() for name in names ]
greeting = greetings[1]
print('greeting=', greeting)
