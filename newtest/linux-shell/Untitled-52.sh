# Given a list of countries, each on a new line, your task is to read them into an array and then display the entire array, with a space between each of the countries' names.
export i=0
while read x
do
    a[i]=$x
    #echo $x
    i=`expr $i + 1`
done
echo ${a[@]}
