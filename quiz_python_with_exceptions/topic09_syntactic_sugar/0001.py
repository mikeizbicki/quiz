names = ['alice', 'bob', 'charlie', 'dave', 'eve']
accumulator = []
for i,name in enumerate(names):
    text = 'number ' + str(i) + ' is ' + name
    accumulator.append(text)
print('accumulator[-1]=', accumulator[-1])

