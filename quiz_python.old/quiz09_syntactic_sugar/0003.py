xss = [i  for x in [4, 5, 6]  if x%2 == 1 for i in range(x) if x%3== 1]
print('xss=', xss)
