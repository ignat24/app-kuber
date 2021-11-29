- Terrafrom, folder `terraform`
    - Create instance
    - Security group
    - ssh key for ansible
- Ansible, folder `ansible`
    - Install nginx
    - Copy index.html

* Files:
- terraform/server.tf - main terraform file
- terraform/variables.tf - Terraform variables
- ansible/ansible.cfg - Ansible config file
- ansible/playbook.yaml - tasks: install nginx, copy file and start nginx
- ansible/hosts.txt - Ansible inventory file
- ansible/ansible_playbook.png - image with working server