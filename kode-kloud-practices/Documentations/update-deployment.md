# We already have a deployment named nginx-deployment and service named nginx-service. Some changes need to be made in this deployment and service, make sure not to delete the deployment and service.

# 1.) Change the service nodeport from 30008 to 32165

# 2.) Change the replicas count from 1 to 5

# 3.) Change the image from nginx:1.18 to nginx:latest

Certainly, to update the existing Kubernetes deployment and service without deleting them, you can use kubectl patch or kubectl edit commands. Here's how you can achieve each of the requested changes:

# Change the service nodeport from 30008 to 32165:
You can modify the NodePort of the service using the kubectl patch command:

# kubectl patch service nginx-service -p '{"spec": {"ports": [{"nodePort": 32165, "port": 80, "protocol": "TCP"}]}}'


# This command updates the nginx-service by changing the NodePort to 32165 while keeping the other settings intact.

# Change the replicas count from 1 to 5:
# To modify the replicas count in the deployment:

    kubectl scale --replicas=5 deployment/nginx-deployment

This command scales the nginx-deployment to have 5 replicas.

# Change the image from nginx:1.18 to nginx:latest:
# To update the image in the deployment:

    kubectl set image deployment/nginx-deployment nginx=nginx:latest

# This command changes the image used in the nginx-deployment from nginx:1.18 to nginx:latest.

# Ensure to substitute nginx-deployment and nginx-service with the actual names of your deployment and service in your Kubernetes cluster. These commands should help you achieve the required modifications without deleting the existing resources.




