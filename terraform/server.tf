provider "aws" {
    region = var.aws_region
}

resource "aws_key_pair" "ssh_key" {
    key_name = "ansible-key"
    public_key = file(var.public_key_file)
}

# Instance ====================================
resource "aws_instance" "webserver"{
    key_name = aws_key_pair.ssh_key.key_name
    ami = "ami-0245697ee3e07e755" //Debian 10
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sg_webserver.id]
    user_data = file(var.user_data_file)

  tags = {
      Name = "WebServer-${var.app}-${var.env}"
  }
}


# Security group====================================
resource "aws_security_group" "sg_webserver"{
    name = "SG-${var.app}-${var.env}"
    description = "SG for Debian web server"

    ingress = [
        {
            description      = "TLS from VPC"
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids  = []
            security_groups  = []
            self = false 
        },
        {
            description      = "SSH from VPC"
            from_port        = 22
            to_port          = 22
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids  = []
            security_groups  = []
            self = false 
        }
    ]

    egress {
      description      = "TLS from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self = false
    }

    tags = {
        Name = "SG for Debian web server"
    }
}

# Output============================
output "public_ip" {
    value = aws_instance.webserver.public_ip
}