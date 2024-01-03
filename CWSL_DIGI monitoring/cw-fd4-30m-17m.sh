cat /tmp/cwspots-Win10-1.log| awk '$3 ~/^10/' | wc -l
cat /tmp/cwspots.log | awk ' length($3) == 7  ' | awk '$3 ~/^18/' | wc -l
echo 0
echo 0
