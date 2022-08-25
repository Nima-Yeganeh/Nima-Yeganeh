import queue
t = int(input())
for i in range(t):
    v, e = map(int, input().split())
    l = [[0 for x in range(v)] for y in range(v)]
    visited = [0 for x in range(v)]
    distance = [-1 for x in range(v)]
    q = queue.Queue()
    for j in range(e):
        a, b = map(int, input().split())
        l[a - 1][b - 1] = l[b - 1][a - 1] = 1
    s = int(input())
    q.put(s - 1)
    visited[s - 1] = 1
    distance[s - 1] = 0
    while not q.empty():
        a = q.get()
        for j in range(v):
            if l[a][j] and not visited[j]:
                q.put(j)
                visited[j] = 1
                distance[j] = distance[a] + 6
    for j in range(v):
        if j != s - 1:
            print(distance[j], end = ' ')
    print()
