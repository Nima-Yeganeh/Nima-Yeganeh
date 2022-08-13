# You are given a text file that will be piped into your command through STDIN. Use grep to display all the lines that contain the word the in them. The search should be sensitive to case. Display only those lines of the input file that contain the word 'the'.
# Input Format
# A text file will be piped into your command through STDIN.
# Output Format
# Output only those lines that contain the word 'the'. The search should be case sensitive. The relative ordering of the lines in the output should be the same as it was in the input.
# paste | grep -iw "the"
# grep -i -w "the"
# egrep -w [Tt][Hh][Ee]
paste | grep  " the "
