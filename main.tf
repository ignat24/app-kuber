provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "tf-key" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_file)
}

resource "aws_instance" "webserver"{
  ami = var.ami_id
  instance_type = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.sg_webserver.id]
  key_name = aws_key_pair.tf-key.id
  user_data = templatefile(var.user_data_template,{
      name = var.project_owner_name,
      l_name = var.project_owner_surname
    }
  )

  tags = {
      Name = "WebServer-${var.app}-${var.env}"
  }
}