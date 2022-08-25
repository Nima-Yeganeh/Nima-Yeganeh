for ((i=1; i<200; i++));
do
    wget google.com/$i -O /dev/null -q --no-dns-cache --no-cache
done
