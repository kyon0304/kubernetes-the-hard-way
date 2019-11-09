#!/bin/bash

for instances in worker-0 worker-1 worker-2; do
    gcloud compute instances describe ${instance} \
        --format 'value[separator=" "](networkInterfaces[0].networkIP,metadata.items[0].value)'
done
