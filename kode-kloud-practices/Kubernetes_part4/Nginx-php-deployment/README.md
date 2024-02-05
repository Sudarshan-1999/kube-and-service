# Create a service to expose this app,
        the service type must be NodePort, nodePort should be 30012.


# Create a config map named nginx-config for nginx.conf as we want to add some custom settings in nginx.conf.


        a) Change the default port 80 to 8099 in nginx.conf.

        b) Change the default document root /usr/share/nginx to /var/www/html in nginx.conf.

        c) Update the directory index to index  index.html index.htm index.php in nginx.conf.


# Create a pod named nginx-phpfpm .


        Create a shared volume named shared-files that will be used by both containers (nginx and phpfpm) also it should be a emptyDir volume.

        Map the ConfigMap we declared above as a volume for nginx container. Name the volume as nginx-config-volume, mount path should be /etc/nginx/nginx.conf and subPath should be nginx.conf

        Nginx container should be named as nginx-container and it should use nginx:latest image. PhpFPM container should be named as php-fpm-container and it should use php:7.3-fpm-alpine image.

        The shared volume shared-files should be mounted at /var/www/html location in both containers. Copy /opt/index.php from jump host to the nginx document root inside the nginx container, once done you can access the app using App button on the top bar.

        Before clicking on finish button always make sure to check if all pods are in running state.

        You can use any labels as per your choice.


Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.