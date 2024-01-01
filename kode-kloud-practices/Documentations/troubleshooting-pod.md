# There is a pod named webserver and the container under it is named as nginx-container. It is using image nginx:latest

# There is a sidecar container as well named sidecar-container which is using ubuntu:latest image.

# Look into the issue and fix it, make sure pod is in running state and you are able to access the app.

# Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

# thor@jump_host ~$ kubectl get all
    NAME            READY   STATUS             RESTARTS   AGE
    pod/webserver   1/2     ImagePullBackOff   0          90s

    NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
    service/kubernetes      ClusterIP   10.96.0.1       <none>        443/TCP        78m
    service/nginx-service   NodePort    10.96.178.226   <none>        80:30008/TCP   90s
# thor@jump_host ~$ kubectl describe pod webserver 

---
Name:             webserver
Namespace:        default
Priority:         0
Service Account:  default
Node:             kodekloud-control-plane/172.17.0.2
Start Time:       Thu, 14 Dec 2023 17:37:20 +0000
Labels:           app=web-app
Annotations:      <none>
Status:           Pending
IP:               10.244.0.5
IPs:
  IP:  10.244.0.5
Containers:
  nginx-container:
    Container ID:   
    Image:          nginx:latests
    Image ID:       
    Port:           <none>
    Host Port:      <none>
    State:          Waiting
      Reason:       ErrImagePull
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/log/nginx from shared-logs (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-7lbx5 (ro)
  sidecar-container:
    Container ID:  containerd://024b78a5cd624251177825745227bf2742018857932fb0d4812543025b383341
    Image:         ubuntu:latest
    Image ID:      docker.io/library/ubuntu@sha256:8eab65df33a6de2844c9aefd19efe8ddb87b7df5e9185a4ab73af936225685bb
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      while true; do cat /var/log/nginx/access.log /var/log/nginx/error.log; sleep 30; done
    State:          Running
      Started:      Thu, 14 Dec 2023 17:37:25 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/log/nginx from shared-logs (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-7lbx5 (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             False 
  ContainersReady   False 
  PodScheduled      True 
Volumes:
  shared-logs:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  kube-api-access-7lbx5:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
   Type     Reason     Age                 From               Message
  ----     ------     ----                ----               -------
  Normal   Scheduled  117s                default-scheduler  Successfully assigned default/webserver to kodekloud-control-plane
  Normal   Pulling    116s                kubelet            Pulling image "ubuntu:latest"
  Normal   Pulled     112s                kubelet            Successfully pulled image "ubuntu:latest" in 3.874500253s (3.874516785s including waiting)
  Normal   Created    112s                kubelet            Created container sidecar-container
  Normal   Started    112s                kubelet            Started container sidecar-container
  Normal   Pulling    69s (x3 over 116s)  kubelet            Pulling image "nginx:latests"
  Warning  Failed     69s (x3 over 116s)  kubelet            Failed to pull image "nginx:latests": rpc error: code = NotFound desc = failed to pull and unpack image "docker.io/library/nginx:latests": failed to resolve reference "docker.io/library/nginx:latests": docker.io/library/nginx:latests: not found
  Warning  Failed     69s (x3 over 116s)  kubelet            Error: ErrImagePull
  Normal   BackOff    30s (x6 over 111s)  kubelet            Back-off pulling image "nginx:latests"
  Warning  Failed     30s (x6 over 111s)  kubelet            Error: ImagePullBackOff
thor@jump_host ~$ kubectl edit pod webserver 


# Please edit the object below. Lines beginning with a '#' will be ignored,
      2 # and an empty file will abort the edit. If an error occurs while saving this file will be
      3 # reopened with the relevant failures.
      4 #
---
      5 apiVersion: v1
      6 kind: Pod
      7 metadata:
      8   annotations:
      9     kubectl.kubernetes.io/last-applied-configuration: |
     10       {"apiVersion":"v1","kind":"Pod","metadata":{"annotations":{},"labels":{"app":"web-app"},"name":"webse        rver","namespace":"default"},"spec":{"containers":[{"image":"nginx:latests","name":"nginx-container","volum        eMounts":[{"mountPath":"/var/log/nginx","name":"shared-logs"}]},{"command":["sh","-c","while true; do cat /        var/log/nginx/access.log /var/log/nginx/error.log; sleep 30; done"],"image":"ubuntu:latest","name":"sidecar        -container","volumeMounts":[{"mountPath":"/var/log/nginx","name":"shared-logs"}]}],"volumes":[{"emptyDir":{        },"name":"shared-logs"}]}}
     11   creationTimestamp: "2023-12-14T17:37:20Z"
     12   labels:
     13     app: web-app
     14   name: webserver
     15   namespace: default
     16   resourceVersion: "6917"
     17   uid: 4aa75634-b132-4aba-965e-80d3a5a426eb
     18 spec:
     19   containers:
     20   - image: nginx:latest
     21     imagePullPolicy: IfNotPresent
     22     name: nginx-container
     23     resources: {}
     24     terminationMessagePath: /dev/termination-log
     25     terminationMessagePolicy: File
     26     volumeMounts:
     27     - mountPath: /var/log/nginx
     28       name: shared-logs


kubectl patch deployment nginx-deployment -p '{"spec": { "template" : {"spec": {"containers": [{"image": "nginx:latest"}]}} }}'
