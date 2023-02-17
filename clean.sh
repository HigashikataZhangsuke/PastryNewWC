#!/bin/bash
para=$1
clean(){
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="pkill -9 java" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key &
}

for ((i=0;i<para;i++)); 
do
	clean &
done


#for i in {1..10}
#do
#	gcloud compute ssh instance-${i} --zone=us-central1-a --command="rm -rf /home/johnny/Testlog" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key &
	
#done
#wait
#echo "Done"

for ((i=0;i<para;i++)); 
do
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="mkdir /home/johnny/Testlog" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key &
	
done
wait
echo "Done"

