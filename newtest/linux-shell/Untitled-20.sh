# We need to print the characters from the thirteenth position to the end.
# Input Format
# A text file with lines of ASCII text only.
# Constraints
# 1 <= N <= 100
# (N is the number of lines of text in the input file)
# Output Format
# The output should contain N lines. For each input line, print the characters from thirteenth position to the end.
paste | cut -c 13-
