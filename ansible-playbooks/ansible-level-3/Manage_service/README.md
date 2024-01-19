# On jump host create an Ansible playbook
         
        /home/thor/ansible/playbook.yml and configure it to install vsftpd on all app servers.


# After installation make sure to 
        
        start and enable vsftpd service on all app servers.


# The inventory 
        
        /home/thor/ansible/inventory is already there on jump host.



# Make sure user thor should be able to run the playbook on jump host.


# Note: 
        Validation will try to run playbook using command 
        
        ansible-playbook -i inventory playbook.yml 
        
        so please make sure playbook works this way, without passing any extra arguments.