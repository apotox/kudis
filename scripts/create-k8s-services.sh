#!/bin/bash

#create public static-ip from shell, this addr will be used as a dns record-a
gcloud compute addresses create kudis-ip --global
#set up a configuration object
kubectl apply -f "$(pwd)/kubes/configmap.yaml"
#create redis pods
kubectl apply -f "$(pwd)/kubes/redis.yaml"
#wait until redis pods get ready
while [[ $(kubectl get pods -l app=my-redis -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod" && sleep 1; done
#create Kudis app deployment
kubectl apply -f "$(pwd)/kubes/kudis.yaml"
#create ingress service binded to kudis-ip address
kubectl apply -f "$(pwd)/kubes/ingress.yaml"
