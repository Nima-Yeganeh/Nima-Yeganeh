m = 1000000007
dp1 = [1,1,2,4]
for i in range(4,1001):
    dp1.append((dp1[-1]+dp1[-2]+dp1[-3]+dp1[-4])%m)
def f(h,w):
    dp2 = []
    dp3 = [pow(dp1[i],h,m) for i in range(w+1)]
    for i in range(w+1):
        tmp = dp3[i]
        for j in range(1,i):
            tmp = (tmp - dp2[j]*dp3[i-j])%m
        dp2.append(tmp)
    return dp2[-1]
for e in range(int(input())):
    print(f(*list(map(int,input().split()))))
