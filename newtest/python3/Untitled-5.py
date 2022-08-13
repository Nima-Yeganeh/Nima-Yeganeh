# Problem Statement :
# The xinput2ian of a list of numbers is essentially its middle element after sorting. The same number of elements occur after it as before. Given a list of numbers with an odd number of elements, find the xinput2ian?
# Function Description
# Complete the findxinput2ian function in the editor below.
# findxinput2ian has the following parameter(s):
# int arr[n]: an unsorted array of integers
# Returns
# int: the xinput2ian of the array
# Input Format
# The first line contains the integer n, the size of arr.
# The second line contains n space-separated integers arr[i]
import math
def main():
    xinput1 = int(input())
    xinput2 = [int(i) for i in input().split()]
    print(findxinput2(xinput2))
def findxinput2(xinput2):
    xinput2.sort()
    if(len(xinput2)%2 == 1):
        return xinput2[int(len(xinput2)/2)]
    else:
        return (xinput2[math.floor(len(xinput2)/2)+math.ceil(len(xinput2)/2)])/2
main()
