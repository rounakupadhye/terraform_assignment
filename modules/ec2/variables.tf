variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  default = "public-key"
}

variable "private_key_name" {
  default = "private-key"
}


variable "subnet_id" {}
variable "vpc_security_group_id" {}