#create service account
gcloud iam service-accounts create k8s-service
#give it permissions
gcloud projects add-iam-policy-binding fit-drive-299914 \
    --member="serviceAccount:k8s-service@fit-drive-299914.iam.gserviceaccount.com" \
    --role="roles/owner"
#Create an IAM policy binding between the IAM service account
#and the predefined Kubernetes service account that ConfigConnector runs:
gcloud iam service-accounts add-iam-policy-binding \
k8s-service@fit-drive-299914.iam.gserviceaccount.com \
    --member="serviceAccount:fit-drive-299914.svc.id.goog[cnrm-system/cnrm-controller-manager]" \
    --role="roles/iam.workloadIdentityUser"
#now we can use k8s gke resources to create google cloud services such as public static-ip