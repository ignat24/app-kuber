# Ansible Playbook to install Nginx

## Initial structure
* Files:
- ansible/ansible.cfg - Ansible config file
- ansible/playbook.yaml - tasks: install nginx, copy file and start nginx
- ansible/hosts.txt - Ansible inventory file
- ansible/ansible_playbook.png - image with working server

## Refactoring
I have restructured the playbook by introducing `roles`:

```
playbook.yaml
roles/
    common/
        tasks/
    nginx/
        tasks/
        templates/
        vars/
```

* `playbook.yaml` orchestartes the roles
* `common` role updates `apt` cache
* `nginx` role installs and configures Nginx Web Server
* more roles can be added if necessary, and also more tasks can be added to each role