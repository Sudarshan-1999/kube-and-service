# There are some applications that need to be deployed on Kubernetes cluster and these apps have some pre-requisites where some configurations need to be changed before deploying the app container. Some of these changes cannot be made inside the images so the DevOps team has come up with a solution to use init containers to perform these tasks during deployment. Below is a sample scenario that the team is going to test first.



        Create a Deployment named as ic-deploy-devops.

        Configure spec as replicas should be 1, labels app should be ic-devops, template's metadata lables app should be the same ic-devops.

        The initContainers should be named as ic-msg-devops, use image ubuntu, preferably with latest tag and use command '/bin/bash', '-c' and 'echo Init Done - Welcome to xFusionCorp Industries > /ic/news'. The volume mount should be named as ic-volume-devops and mount path should be /ic.

        Main container should be named as ic-main-devops, use image ubuntu, preferably with latest tag and use command '/bin/bash', '-c' and 'while true; do cat /ic/news; sleep 5; done'. The volume mount should be named as ic-volume-devops and mount path should be /ic.

        Volume to be named as ic-volume-devops and it should be an emptyDir type.

# Note: 
    The kubectl utility on jump_host has been configured to work with the kubernetes cluster.