def digits_sum(n):
    s = 0
    while n > 9:
        s += n % 10
        n //= 10
    s += n
    return s
def super_digit(n):
    d = digits_sum(n)
    if d < 10:
        return d
    return super_digit(d)
def super_digit_iter(n):
    d = digits_sum(n)
    while d > 9:
        d = digits_sum(d)
    return d
def main():
    n, k = map(int, input().strip().split(' '))
    print(super_digit_iter(digits_sum(n) * k))
if __name__ == "__main__":
    main()