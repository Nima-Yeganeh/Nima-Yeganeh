# show_square_roots1.py

import math

def square_root(numbers):
    result = []
    for number in numbers:
        result.append(math.sqrt(number))
    return result


numbers = [1, 4, 9, 16, 25, 36, 49, 64, 81]
print(square_root(numbers))