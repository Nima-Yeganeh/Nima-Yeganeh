zfiles=$(find . -name "*.py")
# echo $zfiles
for n in $zfiles
do
  # echo $n
  python3 $n
done
