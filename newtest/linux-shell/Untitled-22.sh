# Given a sentence, identify and display its first three words. Assume that the space (' ') is the only delimiter between words.
# Solution 1
#cut -d' ' -f1-3
# Solution 2
awk '{print $1, $2, $3}'
