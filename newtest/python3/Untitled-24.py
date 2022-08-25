q=int(input())
qa=[]
for q0 in range(q):
    li=[int(i) for i in input().strip().split()]
    if li[0]==1:
        qa.append(li[1])
    elif li[0]==2:
        del qa[0]
    else:
        print(qa[0])
