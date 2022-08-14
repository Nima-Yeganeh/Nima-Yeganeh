# Pangrams
# Problem Statement :
# A pangram is a string that contains every letter of the alphabet. Given a sentence determine whether it is a pangram in the English alphabet. Ignore case. Return either pangram or not pangram as appropriate.
# Example
# s =  "The quick brown fox jumps over a lazy dog"
# The string contains all letters in the English alphabet, so return pangram.
# Function Description
#Complete the function pangrams in the editor below. It should return the string pangram if the input string is a pangram. Otherwise, it should return not pangram.
# pangrams has the following parameter(s):
# string s: a string to test
# Returns
# string: either pangram or not pangram
# Input Format
# A single line with string .
# Constraints
# 0   <=  length of s  <=  10^3
# Sample Input
# Sample Input 0
# We promptly judged antique ivory buckles for the next prize
# Sample Output 0
# pangram
import math
import os
import random
import re
import sys
s = input()
alpha_set = set(char for char in s.lower() if char.isalpha())
print("pangram" if len(alpha_set) == 26 else "not pangram")
