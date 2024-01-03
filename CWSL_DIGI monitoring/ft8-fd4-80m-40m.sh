cat /tmp/CWSL_DIGI-Win10-1.log|grep FT8|awk '$5 ~/^357/'|wc -l
cat /tmp/CWSL_DIGI-Win10-1.log|grep FT8|awk '$5 ~/^707/'|wc -l
echo 0
echo 0

#old FT8D based 
#cat /tmp/206.tmp|awk '$6 ~/^357/'|wc -l
#cat /tmp/206.tmp|awk '$6 ~/^707/'|wc -l
