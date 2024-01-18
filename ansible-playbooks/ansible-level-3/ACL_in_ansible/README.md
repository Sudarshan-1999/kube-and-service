# Create a playbook named playbook.yml under /home/thor/ansible directory on jump host, 
        an inventory file is already present under /home/thor/ansible directory on Jump Server itself.


# Create an empty file 
                blog.txt under /opt/devops/ directory on app server 1. 
                Set some acl properties for this file. 
                Using acl provide read '(r)' permissions to group tony 
                (i.e entity is tony and etype is group).


# Create an empty file 
        story.txt under /opt/devops/ directory on app server 2. 
        Set some acl properties for this file. 
        Using acl provide read + write '(rw)' permissions to user steve 
        (i.e entity is steve and etype is user).


# Create an empty file 
        
        media.txt under /opt/devops/ on app server 3. 
        Set some acl properties for this file. 
        Using acl provide read + write '(rw)' permissions to group banner 
        (i.e entity is banner and etype is group).


# Note: 
        Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way, without passing any extra arguments.
