#!/bin/bash
# KUBERNETES_PUBLIC_ADDRESS=$(gcloud compute addresses describe kubernetes-the-hard-way \
#     --region $(gcloud config get-value compute/region) \
#     --format 'value(address)')

# echo $KUBERNETES_PUBLIC_ADDRESS

kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=admin.kubeconfig

kubectl config set-credentials system:node:admin \
    --client-certificate=admin.pem \
    --client-key=admin-key.pem \
    --embed-certs=true \
    --kubeconfig=admin.kubeconfig

kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:node:admin \
    --kubeconfig=admin.kubeconfig

kubectl config use-context default --kubeconfig=admin.kubeconfig