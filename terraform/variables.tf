variable "aws_region"{
    default = "eu-central-1"
}

variable "app" {
    default = "web-server"
}

variable "env" {
    default = "crash-course"
}

variable "public_key_file" {
  type = string
  description = "Path to the file containing SSH public key"
}

variable "user_data_file" {
    type = string
    description = "Bootstrap File"
    default = "bootstrap.sh"
}