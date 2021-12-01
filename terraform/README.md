# Terraform module to provision EC2 instance

## Initial layout and functionality
* Files:
- terraform/server.tf - main terraform file
- terraform/variables.tf - Terraform variables

## Refactoring

* `.gitignore` was modified in order to filter out the `terraform.tfvars`, `terraform.tfstate`, `.terraform.lock.hcl`, `.terraform/` folder and other unnecessary stuff
* Injecting RSA Public Key from file
* `ansible-playbook -C playbook.yaml` failed with the following error:
```
TASK [install] ************************************************************************************************************************************************************************
fatal: [linuxAWS1]: FAILED! => {"changed": false, "msg": "python-apt must be installed to use check mode. If run normally this module can auto-install it."}
```
I've injected bootstrap script `bootstrap.sh` via `user_data`

Also, please consider further improvements according to my suggestions [here](https://github.com/ignat24/app-kuber/pull/7).