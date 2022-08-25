def main():
    N, K = (int(x) for x in sys.stdin.readline().split())
    A = [int(x) for x in sys.stdin.readline().split()]
    setA = set(A)
    count = 0
    for x in A:
        if (x-K) in setA:
            count = count +1
    print (count)
if __name__ == '__main__':
    import sys
    main()
