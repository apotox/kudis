
kubectl apply -f "$(pwd)/kubes/redis.yaml"
while [[ $(kubectl get pods -l app=my-redis -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "waiting for pod" && sleep 1; done