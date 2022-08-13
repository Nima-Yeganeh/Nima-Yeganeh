read a
read b
read c
if ((a == b)) && ((b == c)); then
  echo "EQUILATERAL"
elif ((a == b)); then
  echo "ISOSCELES"
elif ((b == c)); then
  echo "ISOSCELES"
elif ((a == c)); then
  echo "ISOSCELES"
else
  echo "SCALENE"
fi
