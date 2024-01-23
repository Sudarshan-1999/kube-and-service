# Write a playbook.yml under 
        /home/thor/ansible on jump host, 
        an inventory is already present under 
        /home/thor/ansible directory on Jump host itself. 
        Perform below given tasks using this playbook:


# We have a file 

        /opt/itadmin/blog.txt on app server 1. 
        Using Ansible replace module replace 
        
            string xFusionCorp to Nautilus in that file.


        We have a file /opt/itadmin/story.txt on app server 2. 
        Using Ansiblereplace module replace the 
            string Nautilus to KodeKloud in that file.


# We have a file 
        /opt/itadmin/media.txt on app server 3. 
        Using Ansible replace module replace 
            string KodeKloud to xFusionCorp Industries in that file.


# Note: 
        Validation will try to run the playbook using command 
            
            ansible-playbook -i inventory playbook.yml 
        
        so please make sure the playbook works this way without passing any extra arguments.

# After playbook execution 
        thor@jump_host ~/ansible$ ansible -i inventory stapp02 -a "cat /opt/itadmin/story.txt"
        stapp02 | CHANGED | rc=0 >>
        Welcome to KodeKloud Group !
        thor@jump_host ~/ansible$ ansible -i inventory stapp03 -a "cat /opt/itadmin/media.txt"
        stapp03 | CHANGED | rc=0 >>
        Welcome to xFusionCorp !
        thor@jump_host ~/ansible$ 