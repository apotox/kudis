## a simple chat app using redis adapter for socketio to make it scalable on Google Cloud kubernetes cluster (GKE)

[here is a Demo if the cluster is still existing :p](https://k8s.itqan.link)

## install & configuration

if your machine is configured with gcloud, create a cluster and specify a region

`>  chmod +x ./scripts/create-k8s-services.sh`

`>  ./scripts/create-k8s-services.sh`

or fork this repo ,  set up secrets in your workspace: GKE_PROJECT with the name of the project and GKE_SA_KEY with the Base64 encoded JSON service account key (https://github.com/GoogleCloudPlatform/github-actions/tree/docs/service-account-key/setup-gcloud#inputs).

the workflow will build a docker container, publish it to your Google Container Registry, and deploy it to GKE when a push to master branch is made.

happy editing!!

[read more](https://safi-eddine-posts.herokuapp.com/2021-01-27_SocketIO---Redis-at-a-scalable-GKE-Cluster-with-Github-Workflows-844318f80ce.html)

