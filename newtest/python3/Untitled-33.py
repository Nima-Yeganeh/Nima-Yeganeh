def fizz_buzz(n=100):
    for i in range(1, n + 1):
        if i % 3 and i % 5:
            print('FizzBuzz')
        elif i % 3:
            print('Fizz')
        elif i % 5:
            print('Buzz')
        else:
            print(i)
if __name__ == '__main__':
    fizz_buzz()
