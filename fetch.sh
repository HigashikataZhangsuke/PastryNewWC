#!/bin/bash
para=$1
#FILE=~/Testlog/YinzheWordCountTestRoot.txt
for ((i=0;i<para;i++)); 
do
	#if test -f "$FILE"; then
	gcloud compute scp --recurse instance-${i}:~/Testlog /home/johnny/DatarecvGCP/TestlogNode-${i} --ssh-key-file=~/.ssh/my_google_cloud_key &
	#fi 
	#echo ${i}
done
wait
echo "Done"


