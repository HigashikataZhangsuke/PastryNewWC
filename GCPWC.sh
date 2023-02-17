#!/bin/bash
para=$1
clean(){
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="pkill -9 java" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key 
}

Start(){
	gcloud compute ssh instance-${i} --zone=us-central1-a --command="java -cp /home/johnny/WCMTP.jar yinzhe.test.entry.Testentry 9001 10.128.0.89 9001 50 30 50 1000 200" --strict-host-key-checking=no --ssh-key-file=~/.ssh/my_google_cloud_key
}

for ((i=0;i<para;i++)); 
do
	clean &
done

wait
echo "Done"

for ((i=0;i<para;i++)); 
do
	Start &
done

echo "Done"
