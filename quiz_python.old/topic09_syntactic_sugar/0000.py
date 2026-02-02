names = ['alice', 'bob', 'charlie', 'dave', 'eve']
accumulator = []
for i, name in enumerate(names):
    text = name + ' is number ' + str(i)
    accumulator.append(text)
print('accumulator[3]=', accumulator[3])
