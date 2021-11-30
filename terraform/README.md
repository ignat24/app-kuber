# Terraform module to provision EC2 instance

## Initial layout and functionality
* Files:
- terraform/server.tf - main terraform file
- terraform/variables.tf - Terraform variables

## Refactoring

* `.gitignore` was modified in order to filter out the `terraform.tfvars`, `terraform.tfstate`, `.terraform.lock.hcl`, `.terraform/` folder and other unnecessary stuff
* Injecting RSA Public Key from file
* to be continued