#!/bin/bash

for i in 0 1 2; do
    gcloud compute routes create kuberentes-route-10-200-${i}-0-24 \
        --network kuberentes-the-hard-way \
        --next-hop-address 10.240.0.2${i} \
        --destination-range 10.200.${i}.0/24
done

gcloud compute routes list --filter "network: kubernetes-the-hard-way"
