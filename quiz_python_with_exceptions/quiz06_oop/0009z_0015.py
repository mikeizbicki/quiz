import copy
def reverse_list(xs):
    ys = copy.deepcopy(xs)
    for i in range(len(ys)):
        xs[i] = ys[-i-1]
    return ys
xs = [1, 2, 3]
ys = reverse_list(xs)
print('xs=', xs)
print('ys=', ys)
