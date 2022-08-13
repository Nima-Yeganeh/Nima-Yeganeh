# In this challenge, we practice using the awk command for text-munging and data processing tasks. The awk interpreter may be used for a lot of text-munging and data-processing tasks that require some quick scripting work.
# Task
# You are given a file with four space-separated columns containing the scores of students in three subjects. The first column contains a single character (A-Z), the student identifier. The next three columns have three numbers each. The numbers are between 0 and 100, both inclusive. These numbers denote the scores of the students in English, Mathematics, and Science, respectively.
# Your task is to identify whether each of the students has passed or failed.
# A student is considered to have passed if (s)he has a score 50 or more in each of the three subjects.
paste | awk '{if($2 > 50 && $3 > 50 && $4 > 50){print $1" : Pass"}else{print $1 " : Fail"}}'
