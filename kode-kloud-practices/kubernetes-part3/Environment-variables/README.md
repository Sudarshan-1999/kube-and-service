# Create a pod named envars.

    Container name should be fieldref-container, 
    use image nginx preferable latest tag, 
    use command 'sh', '-c' and args should be

        'while true; do echo -en '/n'; 
        printenv NODE_NAME POD_NAME; 
        printenv POD_IP POD_SERVICE_ACCOUNT; 
        sleep 10; done;'

    (Note: please take care of indentations)

# Define Four environment variables as mentioned below:
        a.) The first env should be named as NODE_NAME, set valueFrom fieldref and fieldPath should be spec.nodeName.

        b.) The second env should be named as POD_NAME, set valueFrom fieldref and fieldPath should be metadata.name.

        c.) The third env should be named as POD_IP, set valueFrom fieldref and fieldPath should be status.podIP.

        d.) The fourth env should be named as POD_SERVICE_ACCOUNT, set valueFrom fieldref and fieldPath shoulbe be spec.serviceAccountName.

        Set restart policy to Never.

# To check the output, 
        exec into the pod and use printenv command.

# Note: 
        The kubectl utility on jump_host has been configured to work with the kubernetes cluster.