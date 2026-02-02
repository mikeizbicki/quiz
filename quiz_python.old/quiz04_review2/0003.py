accumulator = 99
xs = [23, 50, 22, 99, 123, -4]
for x in xs:
    if x < accumulator:
        accumulator = x
print("accumulator=", accumulator)
