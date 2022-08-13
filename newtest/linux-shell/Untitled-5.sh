# Given  integers, compute their average, rounded to three decimal places.
# Input Format
# The first line contains an integer, .
# Each of the following  lines contains a single integer.
# Output Format
# Display the average of the  integers, rounded off to three decimal places.
read N
i=1
sum=0
while [ $i -le $N ]
do
  read num
  sum=$((sum + num))
  i=$((i + 1))
done
#avg=$(echo $sum / $N | bc -l)
printf %.3f $(echo $sum / $N | bc -l)
