# show_square_roots2.py

import math

def square_root(numbers):
    result = [math.sqrt(number) for number in numbers]
    return result


numbers = [1, 4, 9, 16, 25, 36, 49, 64, 81]
print(square_root(numbers))