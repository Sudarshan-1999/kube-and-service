# We already have a secret key file media.txt 
        under /opt location on jump host. 
        Create a generic secret named media, 
        it should contain the password/license-number present in media.txt file.


        Also create a pod named secret-xfusion.

# create Secret
        
        kubectl create secret generic media --from-file=/opt/media.txt



# Configure pod's 
        spec as container name should be secret-container-xfusion, 
        image should be fedora preferably with latest tag (remember to mention the tag with image). 
        Use sleep command for container so that it remains in running state. 
        Consume the created secret and mount it under /opt/apps within the container.

# create pod    
        
        kubectl apply -f secret-pod.yml

# To verify you can exec 
        into the container secret-container-xfusion, 
        to check the secret key under the mounted path /opt/apps. 
        Before hitting the Check button please make sure pod/pods are in running state, 
        also validation can take some time to complete so keep patience.


# Note: 
        The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

