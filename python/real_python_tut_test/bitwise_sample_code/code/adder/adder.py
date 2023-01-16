# adder/adder.py

def print_unsigned(value):
    # Loop through binary digits of value, shifting them off and storing them
    # in bit_string
    bit_string = []
    for i in range(4):
        bit_value = (value & (1 << i)) >> i
        bit_string.append(str(bit_value))

    # Bit string is backwards
    bit_string = "".join(bit_string)
    bit_string = bit_string[::-1]
    print("bits:", bit_string)

def half_adder(a0, b0):
    s = (a0 & 1) ^ (b0 & 1)
    c = (a0 & 1) & (b0 & 1)
    return s, c

def full_adder(a0, b0, ci):
    s0, c0 = half_adder(ci, a0)
    s1, c1 = half_adder(s0, b0)

    cout = c0 | c1
    return s1, cout

def four_bit_adder(a, b):
    # Ensure 4-bits only
    a = a & 0b1111
    b = b & 0b1111

    s = 0
    cout = 0

    for i in range(4):
        a_bit = (a & (1 << i)) >> i
        b_bit = (b & (1 << i)) >> i

        s_bit, cout = full_adder(a_bit, b_bit, cout)
        s |= s_bit << i

    print_unsigned(s)
    return s
