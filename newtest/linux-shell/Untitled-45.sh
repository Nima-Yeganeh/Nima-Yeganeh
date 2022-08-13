# ask
# For each line in a given input file, transform all the occurrences of the word 'thy' with 'your'. The search should be case insensitive, i.e. 'thy', 'Thy', 'tHy' etc. should be transformed to 'your'.
# Input Format
# A text file will be piped into your command via STDIN.
# Output Format
# Transform and display the text as required in the task.
paste | sed 's/thy/your/gi'
