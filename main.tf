provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "webserver"{
    ami = "ami-0245697ee3e07e755" //Debian 10
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sg_webserver.id]
    user_data = templatefile("user_data.tpl",{
      name = "Danil",
      l_name = "Ignatushkun"
  }
  )

  tags = {
      Name = "WebServer-${var.app}-${var.env}"
  }
}