xs = [-2, -1, 0, 1, 2]
accumulator = 0
for x in xs:
    accumulator += 1
    if x:
        accumulator += 1
print('accumulator=', accumulator)
