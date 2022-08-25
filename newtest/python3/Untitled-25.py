t = int(input())
while t:
    ar = ['e']
    s = input()
    for i in s:
        if i == '(':
            ar.append('(')
        elif i == '[':
            ar.append('[')
        elif i == '{':
            ar.append('{')
        elif i == ')':
            k = ar.pop()
            if k != '(':
                ar.append('k')
                break
        elif i == ']':
            k = ar.pop()
            if k != '[':
                ar.append('k')
                break
        elif i == '}':
            k = ar.pop()
            if k != '{':
                ar.append('k')
                break
        #print(ar)
    if len(ar) == 0 or ar[len(ar)-1] != 'e':
        print('NO')
    else:
        #print(len(ar), ar[len(ar)-1])
        print('YES')
    t-=1
    