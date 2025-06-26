squares = (x * x for x in range(10))  # lazy
print(next(squares))  # computes x=0
print(next(squares))  # computes x=1
