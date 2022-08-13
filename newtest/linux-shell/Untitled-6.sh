#read N
N=3
i=1
while [ $i -le $N ]
do
  read str
  echo $str | cut -c 3
  i=$((i + 1))
done
