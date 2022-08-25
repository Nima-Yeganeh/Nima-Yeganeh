import heapq
n, s = [int(i) for i in input().split()]
cookies = [int(i) for i in input().split()]
heapq.heapify(cookies)
ops = 0
while (cookies[0] < s):
    try:
        ops += 1
        cookie1 = heapq.heappop(cookies)
        cookie2 = heapq.heappop(cookies)
        newcookie = 1*cookie1 + 2*cookie2
        heapq.heappush(cookies, newcookie)
    except IndexError:
        ops = -1
        break
print(ops)
