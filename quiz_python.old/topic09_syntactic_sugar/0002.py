sentence = 'python is *weird*'
accumulator = ''
for i, char in enumerate(sentence):
    if char == '*' and sentence[i-1] == ' ':
        accumulator += '_'
    elif char == '*':
        accumulator += '_!'
    else:
        accumulator += char
print('accumulator=', accumulator)
