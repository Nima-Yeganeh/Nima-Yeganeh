for ((i=1; i<200; i++));
do
    wget google.com/$i.html -O /dev/null -q --no-dns-cache --no-cache && sleep 0
done
