# We already have an inventory file under
         
            /home/thor/ansible
        
        directory on jump host. 
# Write a playbook playbook.yml 

        under /home/thor/ansible directory on jump host itself.
        Using the playbook perform below given tasks:

        Install httpd web server on all app servers, and make sure its service is up and running.

        Create a file /var/www/html/index.html with content:

            This is a Nautilus sample file, created using Ansible!

        Using lineinfile Ansible module add some more content in /var/www/html/index.html file. Below is the content:

            Welcome to xFusionCorp Industries!
        
        Also make sure this new line is added at the top of the file.

        The /var/www/html/index.html file's user and group owner should be apache on all app servers.

        The /var/www/html/index.html file's permissions should be 0755 on all app servers.


# Note: 
        Validation will try to run the playbook using command 
        
            ansible-playbook -i inventory playbook.yml 
        
        so please make sure the playbook works this way without passing any extra arguments.