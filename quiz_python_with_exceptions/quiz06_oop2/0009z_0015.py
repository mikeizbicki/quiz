def reverse_list(xs):
    ys = []
    for i in range(len(xs)):
        ys.append(xs.pop())
    return ys
xs = [3, 2, 1]
ys = reverse_list(xs)
print('xs=', xs)
print('ys=', ys)
