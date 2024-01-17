# Create a PersistentVolume named as pv-nautilus.
        Configure the spec as storage class should be manual, 
        set capacity to 3Gi, 
        set access mode to ReadWriteOnce, 
        volume type should be hostPath and set path to /mnt/security
        (this directory is already created, 
        you might not be able to access it directly,
         so you need not to worry about it).

# Create a PersistentVolumeClaim named as pvc-nautilus. 
        Configure the spec as storage class should be manual,
        request 1Gi of the storage, 
        set access mode to ReadWriteOnce.

# Create a pod named as pod-nautilus,
        mount the persistent volume you created with claim name pvc-nautilus at document root of the web server, the container within the pod should be named as container-nautilus using image httpd with latest tag only (remember to mention the tag i.e httpd:latest).

# Create a node port 
        type service named web-nautilus using node port 30008 
        to expose the web server running within the pod.

# Note: 
        The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

