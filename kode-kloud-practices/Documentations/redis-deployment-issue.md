
# The deployment name is redis-deployment. The pods are not in running state right now, so please look into the issue and fix the same.

    kubectl get configmaps

    kubectl describe pods

    kubectl describe deployment redis-deployment 

    kubectl edit deployment redis-deployment


# change the not matching condition in deployment yml 

    redis-conig ---> redis-config 

    redis:alpin ----> redis-alpine