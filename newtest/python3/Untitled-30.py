q = int(input())
stack = ['']
for _ in range(q):
    o_type, *par = input().split()
    o_type = int(o_type)
    if o_type in (1, 2, 3):
        par = par[0]
        if o_type in (2, 3):
            par = int(par)
    if o_type == 1:
        stack.append(stack[-1] + par)
    elif o_type == 2:
        stack.append(stack[-1][:-par])
    elif o_type == 3:
        print(stack[-1][par - 1])
    elif o_type == 4:
        stack.pop()
        