import copy
xs = [[1, 2, 3], [4, 5, 6]]
ys = copy.deepcopy(xs)
ys[0].append('A')
print('xs=', xs)
