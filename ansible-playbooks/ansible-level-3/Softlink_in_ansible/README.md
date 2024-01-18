# Write a playbook.yml under 
        /home/thor/ansible directory on jump host, an inventory file is already present 
        under /home/thor/ansible directory on jump host itself. 
        Using this playbook accomplish below given tasks:


# Create an empty file 
        /opt/itadmin/blog.txt on app server 1;
        its user owner and group owner should be tony. 
        Create a symbolic link of 
        source path /opt/itadmin to destination /var/www/html.


# Create an empty file 
        /opt/itadmin/story.txt on app server 2;
        its user owner and group owner should be steve. 
        Create a symbolic link of 
        source path /opt/itadmin to destination /var/www/html.


# Create an empty file 
        /opt/itadmin/media.txt on app server 3; 
        its user owner and group owner should be banner. 
        Create a symbolic link of 
        source path /opt/itadmin to destination /var/www/html.


# Note: 
        Validation will try to run the playbook using command

            ansible-playbook -i inventory playbook.yml 
            
        so please make sure playbook works this way without passing any extra arguments.