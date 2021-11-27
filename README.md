# Terraform module
Web application with EC2 instance

## Initial version
- I use terraform to create EC2 instance with debian 10
- main.tf - creates instance
- security.tf - creates security group for instance
- variables.tf - contains variables
- user_data.tpl - contains bash script's template to install Nginx Web Server and create `index.html`
- outputs.tf - prints out EC2 instance's public ip

## Refactoring
### Creating conventional module structure
You already have your code spitted logically into the files, which is good. I suggest to add more files:

* `provider.tf` - containing Provider's configuration. It is not changed as much as other parts of code, so it's better to keep it in a separate file
* `terraform.tfvars` - the values of variables are specified here. They re-write teh defaults in the `variables.tf`. Also, they are usually project-specific, so it's better to add `terraform.tfvars` to `.gitignore`. You should try keeping Terraform code as generic as possible, so it can be easily re-used by other people.
* `terraform.tfvars.example` - this one is not processed by `terraform` CLI, but contains some examples on how to specify the variables, some comments, etc. Store it in the repo, so everyone can use it as an example

### Getting rid of hard-coded parameters
All the input parameters, used by resources, providers and outputs, should come from:

* variables
```
provider "aws" {
    region = var.aws_region
}
```

* other resources
```
    vpc_security_group_ids = [aws_security_group.sg_webserver.id]
```

Avoid using hard-coded parameters in the Terraform resources, data sources, outputs, etc. Basic rule - do not send to repository any project-specific or environment-specific parameters, like `name = "Danil"` or `l_name = "Ignatushkun"` in the initial version (not to mention credentials and other sensitive data). However, it is useful to have default values in the `variables.tf`, so that the deployment can go even if we don't have the `terraform.tfvars` in our environment wheer we run `terraform` CLI. Those default can be re-written, for example, via `terraform.tfvars`, if necessary.

### SSH keys
You did not specify the `key_name`, name of the RSA key pair to be used to authenticate SSH connect to the VM. It will not prevent the Web Server from running, but you won't be able to ssh to the instance.
To fix that, I've added `aws_key_pair` resource and referenced it in the `aws_instance`. Please take a look at the `main.tf`, `variables.tf` and `terraform.tfvars.example` to see how it works. Also, the file containing RSA key must not be sent to the repository, so it's better to keep it outside the local working copy of your repo.

### Firewall Rules - Dynamic block
In the `security.tf` file `aws_security_group` resource contains `ingress {}` and `egress {}` structures, which are designed to repeat multiple times inside the resource. I've implemented the dynamic blocks, which prevents us from copying and pasting similar chunks of code many times as more rules are added.

>**Note:** for the `egress_fw_rules` variable in the `variables.tf` file I've specified a `default` parameter, which defines the egress firewall rule allowing all egress requests from the EC2 instance. That is required for the bootstrap script to be able to access package repository and install Nginx Web Server. On the other hand, the default value for the `ingress_fw_rules` is an empty list. Which basically means that all ingress requests, sent to EC2, will be rejected. That won't prevent the bootstrap script form installing Nginx, but the Web Server will not be accessible from the external network. Unless a set of ingress rules is defined in the `terraform.tfvars`. It can be done after the EC2 instance is provisioned witout re-creating the EC2.