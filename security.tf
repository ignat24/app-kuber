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