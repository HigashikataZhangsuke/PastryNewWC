#!/bin/bash
para=$1
for ((i=0;i<para;i++)); 
do
	gcloud compute instances create instance-${i}  \
    --project=vt-gcp-00015 \
    --zone=us-central1-a \
    --machine-type=e2-highmem-4 \
    --network-interface=network-tier=PREMIUM,subnet=default \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=468098223236-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/cloud-platform \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230206,mode=rw,size=10,type=projects/vt-gcp-00015/zones/us-central1-a/diskTypes/pd-balanced \
    --shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --reservation-affinity=any &
done

wait
echo "Done"
