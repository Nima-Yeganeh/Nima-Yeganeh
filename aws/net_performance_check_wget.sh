for ((i=1; i<200; i++));
do
    wget google.com -O /dev/null -q --no-dns-cache --no-cache && sleep 0
done
