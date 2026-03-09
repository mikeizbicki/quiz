import copy
def reverse_list(xs):
    ys = copy.copy(xs)
    for i in range(len(ys)):
        ys[i] = xs[-i-1]
    return ys
xs = [1, 2, 3]
ys = reverse_list(xs)
print('xs=', xs)
print('ys=', ys)
