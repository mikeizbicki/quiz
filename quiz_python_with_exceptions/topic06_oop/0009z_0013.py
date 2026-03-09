def reverse_list(xs):
    ys = []
    xs = xs[:]
    for i in range(len(xs)):
        ys.append(xs.pop())
    return ys
xs = [1, 2, 3]
ys = reverse_list(xs)
print('xs=', xs)
print('ys=', ys)
