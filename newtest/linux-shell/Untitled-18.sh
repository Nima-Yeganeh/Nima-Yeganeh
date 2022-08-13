# Display the first four characters from each line of text.
while read line
do
    echo $line | cut -c 1-4
done
