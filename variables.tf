variable "aws_region"{
    default = "eu-central-1"
}

variable "app" {
    default = "web-server"
}

variable "env" {
    default = "crash-course"
}

variable "key_pair_name" {
  type = string
  default = "DevOpsLab"
}

variable "public_key_file" {
  type = string
  description = "Path to the file containing SSH public key"
}

variable "ami_id" {
    type = string
    description = "EC2 AMI ID"
    default = "ami-0245697ee3e07e755"
}

variable "ec2_instance_type" {
    type = string
    description = "EC2 Instance Type"
    default = "t2.micro"
}

variable "user_data_template" {
    type = string
    description = "Path to the user data template"
    default = "user_data.tpl"
}

variable "project_owner_name" {
    type = string
    description = "Project Owner Name"
    default = "John"
}

variable "project_owner_surname" {
    type = string
    description = "Project Owner Surname"
    default = "Silver"
}

variable "sg_description" {
    type = string
    description = "Security Group Description"
    default = "SG for EC2 Instance"
}

variable "sg_tags" {
    type = map
    description = "Security Group tags"
    default = {
        Name = "SG for EC2 Instance"
    }
}

variable "ingress_fw_rules" {
  type = any
  description = "Ingress Firewall Rules"
  default = []
}

variable "egress_fw_rules" {
  type = any
  description = "Egress Firewall Rules"
  default = [
    {
      description      = "Egress Any"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self = false        
    }
  ]
}