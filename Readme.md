- Ansible 
    - Install nginx
    - Copy index.html
- Terrafrom
    - Create instance
    - Security group
    - ssh key for ansible

* Files:
- ansible.cfg - config file
- playbook2.yml - task with install nginx, copy file and start nginx
- hosts.txt - file with configure instance
- server.tf - main terraform file
- ansible_playbook.png - image with working server