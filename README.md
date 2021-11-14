# app-kuber
Web application with EC2 instance

- I use terraform for create EC2 instance with debian 10
- main.tf - create instance
- security.tf - create security group for instance
- variables.tf - variables
- user_data.tpl - file for install nginx and create index.html
- outputs.tf - file for outputing public ip over instance