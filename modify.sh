#!/bin/bash
para=$1

clean(){
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="pkill -9 java" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key &
}

for ((i=0;i<para;i++)); 
do
	clean &
done


for ((i=0;i<para;i++)); 
do
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="rm -rf /home/johnny/WCMTP.jar" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key
	gcloud compute scp --recurse /home/johnny/WCMTP.jar instance-${i}:~/WCMTP.jar  --ssh-key-file=~/.ssh/my_google_cloud_key 
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="rm -rf /home/johnny/Testlog/*.txt" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key &
	
done
wait
echo "Done"

