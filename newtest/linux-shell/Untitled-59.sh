# There are N integers in an array A. All but one integer occur in pairs. Your task is to find the number that occurs only once.
read len
readarray arr
res=0
for elem in ${arr[@]} ; do
    res=$(( res ^ elem ))
done
echo "$res"
