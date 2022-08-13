# Input Format
# A list of country names. The only characters present in the country names will be upper or lower case characters and hyphens.
# Output Format
# Display the sliced portion of the array of country names, with a space between each of them.
readarray array
for i in {3..7} ; do
    echo -ne ${array[${i}]}
    echo -ne " "
done
