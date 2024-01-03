cat /tmp/cwspots-Win10-1.log | awk ' length($3) == 6  ' | awk '$3 ~/^18/' | wc -l
cat /tmp/cwspots-Win10-1.log | awk '$3 ~/^5/' | wc -l
echo 0
echo 0
