# The pod name is nginx-phpfpm and configmap name is nginx-config. Figure out the issue and fix the same.


# Once issue is fixed, copy /home/thor/index.php file from the jump host to the nginx-container under nginx document root and you should be able to access the website using Website button on top bar.

        40  k get cm nginx-config 
        41  k describe  cm nginx-config 
        42  k get pods nginx-phpfpm -o yaml > new_pod.yml
        43  ls
        44  sed -n '/html/p'
        45  sed -n '/html/p' new_pod.yml 
        46  sed -n '/usr/share/nginx/html/p' new_pod.yml 
        47  sed -n '/\/usr\/share\/nginx\/html/p' new_pod.yml 
        48  sed --help

        54  sed -i 's/\/usr\/share\/nginx\/html/\/var\/www\/html/g' new_pod.yml 
        55  sed -n '/\/usr\/share\/nginx\/html/p' new_pod.yml 

        57  sed -n '/html/p' new_pod.yml 
        58  k replace -f  new_pod.yml 
        59  k replace -f  new_pod.yml --force
        60  ls

        62  k cp index.php nginx-phpfpm:/var/www/html -c nginx-container