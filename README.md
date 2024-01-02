# Kubernetes practice 

#  ~$ kubectl get pods
    NAME                                READY   STATUS    RESTARTS   AGE
    nginx-deployment-698959d995-hw2hr   1/1     Running   0          70s
    nginx-deployment-698959d995-qpw9p   1/1     Running   0          68s
    nginx-deployment-698959d995-rcgwq   1/1     Running   0          77s


#  ~$ kubectl get deployment
    NAME               READY   UP-TO-DATE   AVAILABLE   AGE
    nginx-deployment   3/3     3            3           96s


#  ~$ kubectl get deployments
    NAME               READY   UP-TO-DATE   AVAILABLE   AGE
    nginx-deployment   3/3     3            3           98s


#  ~$ kubectl rollout history deployment/nginx-deployment 
    deployment.apps/nginx-deployment 
    REVISION  CHANGE-CAUSE
    1         <none>
    2         kubectl set image deployment nginx-deployment nginx-container=nginx:alpine --kubeconfig=/root/.kube/config --record=true


#  ~$ kubectl rollout undo deployment/nginx-deployment --to-revision=1
    
    deployment.apps/nginx-deployment rolled back
    
#  ~$ kubectl rollout status deployment/nginx-deployment 
    
    deployment "nginx-deployment" successfully rolled out


#  ~$ kubectl rollout status deployment/nginx-deployment 
    deployment "nginx-deployment" successfully rolled out


#  ~$ kubectl get pods 
    NAME                               READY   STATUS    RESTARTS   AGE
    nginx-deployment-989f57c54-fgw2b   1/1     Running   0          30s
    nginx-deployment-989f57c54-hlw46   1/1     Running   0          34s
    nginx-deployment-989f57c54-t98d9   1/1     Running   0          32s

    

#  ~$ kubectl get deployments.apps 
    NAME               READY   UP-TO-DATE   AVAILABLE   AGE
    nginx-deployment   3/3     3            3       
