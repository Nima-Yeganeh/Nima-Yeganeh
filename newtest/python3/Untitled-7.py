# Diagonal Difference
# Problem Statement :
# Given a square matrix, calculate the absolute difference between the sums of its diagonals.
# For example, the square matrix arr is shown below:
# 1 2 3
# 4 5 6
# 9 8 9  
# The left-to-right diagonal = 1+ 5 + 9 = 15. The right to left diagonal =  3 +5 +9 = 17 . Their absolute difference is |15-17| = 2 .
# Function description
# Complete the diagonal difference function in the editor below.
# diagonalDifference takes the following parameter:
# int arr[n][m]: an array of integers
# Return
# int: the absolute diagonal difference
# Input Format
# The first line contains a single integer, n, the number of rows and columns in the square matrix  arr .
# Each of the next n lines describes a row, arr[i] , and consists of n space-separated integers arr[i][j]
# Constraints
# -100 <= a[i][j]  <= 100
# Output Format
# Return the absolute difference between the sums of the matrix's two diagonals as a single integer.
import math
import os
import random
import re
import sys
N=int(input())
grid=[]
for i in range(0,N):
    lists=[int(i) for i in input().split()]
    grid.append(lists)
count=0
sum1=0
sum2=0
j1=0
j2=N-1
while(count<N):
    sum1=sum1+grid[count][j1]
    sum2=sum2+grid[count][j2]
    count+=1
    j1+=1
    j2-=1
print(abs(sum1-sum2))
