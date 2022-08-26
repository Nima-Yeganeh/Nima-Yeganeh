import time
def rate_limit():
    b = True
    n = int(input())
    #print(n)
    tt = time.time()
    if n <= 3:
        for i in range(0,n):
            t1 = tt
            answer = input()
            t2 = time.time()
            t = t2 - t1
            if t > 1:
                print(t)
                print("Out of time!")
                b = False
            elif b == True and i == n-1:
                print(t)
                #print("1")
                #print(round(t))
    elif n <= 10:
        for i in range(0,n):
            t1 = tt
            answer = input()
            t2 = time.time()
            t = t2 - t1
            if t > 10:
                print(t)
                print("Out of time!")
                b = False
            elif b == True and i == n-1:
                print(t)
                #print("10")
                #print(round(t))
    else:
            print('Done!')
if __name__ == '__main__':
    rate_limit()
