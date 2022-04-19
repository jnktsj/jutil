echo 1 | awk '{print "total\tused\tavailable"}' > memory_use.log
while [ 1 ]
do
  free -m | grep "Mem" | awk '{print $2,$3,$NF}' OFS="\t" >> memory_use.log
  sleep 60
done
