cat /tmp/CWSL_DIGI-NUC-FD4-high.log|grep FT8|awk '$5 ~/^2491/'|wc -l
cat /tmp/CWSL_DIGI-NUC-FD4-high.log|grep FT8|awk '$5 ~/^2807/'|wc -l
echo 0
echo 0

#old FT8D based 
#cat /tmp/206.tmp|awk '$6 ~/^2491/'|wc -l
#cat /tmp/206.tmp|awk '$6 ~/^2807/'|wc -l
