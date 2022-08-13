# Task
# For each line in a given input file, transform the first occurrence of the word 'the' with 'this'. The search and transformation should be strictly case sensitive.
# Input Format
# A text file will be piped into your command through STDIN.
# Output Format
# Transform the text as specified by the task.
paste | sed -e "s/ the / this /"
