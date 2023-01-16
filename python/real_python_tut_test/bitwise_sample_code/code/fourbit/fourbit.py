# fourbit/fourbit.py
class FourBit(int):
    def __init__(self, num):
        if num > 0b1111:
            raise AttributeError("Can only store four bits")

        self.num = num

    # --- Output
    def __str__(self):
        return bin(self.num)

    def __repr__(self):
        return f"FourBit({bin(self.num)})"

    # --- Math
    def __add__(self, other):
        return FourBit((self.num + other.num) & 0b1111)

    def __sub__(self, other):
        if other.num > self.num:
            return FourBit(0)

        return FourBit((self.num - other.num))

    def __mul__(self, other):
        return FourBit((self.num * other.num) & 0b1111)

    def __truediv__(self, other):
        return FourBit((self.num // other.num) & 0b1111)

    def __floordiv__(self, other):
        return FourBit((self.num // other.num) & 0b1111)

    # --- Bitwise
    def __and__(self, other):
        return FourBit(self.num & other.num)

    def __or__(self, other):
        return FourBit((self.num | other.num))

    def __xor__(self, other):
        return FourBit(self.num ^ other.num)

    def __invert__(self):
        return FourBit(~self.num & 0b1111)
