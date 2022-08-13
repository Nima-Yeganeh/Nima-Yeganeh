# A mathematical expression containing +,-,*,^, / and parenthesis will be provided. Read in the expression, then evaluate it. Display the result rounded to  decimal places.
read a
x=$a
#echo $(($x))
printf %.3f $(echo "$a" | bc -l)
