#!/bin/bash
para=$1
for ((i=0;i<para;i++)); 
do
	gcloud compute scp --recurse /home/johnny/WCMTP.jar instance-${i}:~/WCMTP.jar  --ssh-key-file=~/.ssh/my_google_cloud_key 
	gcloud compute scp --recurse /home/johnny/WCDatasetbig instance-${i}:~/WCDatasetbig  --ssh-key-file=~/.ssh/my_google_cloud_key &
done

for ((i=0;i<para;i++)); 
do
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="mkdir Testlog" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key 
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="sudo apt -y install openjdk-11-jdk" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key 
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="sudo apt -y install default-jre" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key &
done
wait
echo "Done"
