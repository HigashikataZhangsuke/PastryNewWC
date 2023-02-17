#!/bin/bash
para=$1
#FILE=~/Testresult/YinzheWordCountTestRoot.txt
#for i in {1..10}
#do
	#if test -f "$FILE"; then
#	gcloud compute scp instance-${i}:~/Testlog/YinzheWordCountTestRoot.txt /home/johnny/#DatarecvGCP/DataVM.txt --ssh-key-file=~/.ssh/my_google_cloud_key &
#	#fi &
#done
#wait
#echo "Done"

for ((i=0;i<para;i++)); 
do
	gcloud compute instances stop instance-${i} &
done

wait
echo "Done"
