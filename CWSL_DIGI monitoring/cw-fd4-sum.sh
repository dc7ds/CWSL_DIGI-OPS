cat /tmp/cwspots.log > /tmp/cwspots-FD4.log
cat /tmp/cwspots-Win10-1.log >> /tmp/cwspots-FD4.log
cat /tmp/cwspots-FD4.log | wc -l
cat /tmp/cwspots-FD4.log | awk '{ print $4 }' | sort -u | wc -l
echo 0
echo 0
