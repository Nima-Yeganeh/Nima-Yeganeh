# https://leetcode.com/explore/challenge/card/august-leetcoding-challenge/550/week-2-august-8th-august-14th/3419/
s=input()
sum_=ord(s[0])-64
for i in range(1,len(s)):
    sum_=sum_*26+ord(s[i])-64
else:
    print(sum_)
