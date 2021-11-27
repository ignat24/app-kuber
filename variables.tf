variable "aws_region"{
    default = "eu-central-1"
}

variable "app" {
    default = "web-server"
}

variable "env" {
    default = "crash-course"
}

data "aws_availability_zones" "avaliable" {
  
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "az_count" {
  description = "Count of using availability zones"
  default = 2
}

variable "aws_dnc" {
  type = bool
  default = true
}

variable "aws_dnc_hostname" {
  type = bool
  default = true
}


variable "cidr_block_route" {
    default = "0.0.0.0/0"
}
