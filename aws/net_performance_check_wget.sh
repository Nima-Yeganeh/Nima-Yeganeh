for ((i=1; i<200; i++));
do
    num1=$(shuf -i 1-240 -n 1)
    num2=$(shuf -i 1-240 -n 1)
    num3=$(shuf -i 1-240 -n 1)
    num4=$(shuf -i 1-240 -n 1)
    wget google.com -O /dev/null -q --no-dns-cache --no-cache && 
    wget $num1.$num2.$num3.$num4 -O /dev/null -q --no-dns-cache --no-cache && 
    sleep 0
    ps aux | grep wget
done
