cat /tmp/CWSL_DIGI-Win10-1.log|grep FT8|awk '$5 ~/^101/'|wc -l
cat /tmp/CWSL_DIGI-NUC-FD4-high.log|grep FT8|awk '$5 ~/^1407/'|wc -l
echo 0
echo 0

#old FT8D based 
#cat /tmp/206.tmp|awk '$6 ~/^101/'|wc -l
#cat /tmp/206.tmp|awk '$6 ~/^1407/'|wc -l
