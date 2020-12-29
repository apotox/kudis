#!/bin/bash
#create service account

# $1 ==> serviceName
# $2 ==> your projectId

gcloud iam service-accounts create $1
#give it permissions
gcloud projects add-iam-policy-binding  \
    --member="serviceAccount:$1@$2.iam.gserviceaccount.com" \
    --role="roles/owner"
#Create an IAM policy binding between the IAM service account
#and the predefined Kubernetes service account that ConfigConnector runs:
gcloud iam service-accounts add-iam-policy-binding $1@$2.iam.gserviceaccount.com \
    --member="serviceAccount:$2.svc.id.goog[cnrm-system/cnrm-controller-manager]" \
    --role="roles/iam.workloadIdentityUser"
#now we can use k8s gke resources to create google cloud services such as public static-ip