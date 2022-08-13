# We now transition to some basic examples of bash scripting for the purpose of text processing and data munging. In this challenge, we practice reading and filtering an array.
readarray -t country
echo "${country[@]/*[aA]*/}"|sed 's/^\s*//g'
