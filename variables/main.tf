
provider "aws" {
  region="eu-west-2"
}

variable "vpcname" {
  type = string
  default = "myvpc"

}

variable "sshport" {
  type = number
  default = 22
  }

variable "enabled" {
    default = true
}

variable "mylist" {
  type = list(string)
  default = ["value1", "value2"]
}

variable "mymap" {
  type = map
  default = {
    key1="value1"
    key2="value2"
  }
}

variable "inputname" {
  type = string
  description = "set the name of VPC"
  }


resource "aws_vpc" "myvpc"{
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.inputname
  }
}
output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "tuple" {
  type = tuple(string,number, string)
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "Tj"
    port = [80,22,2043]
  }
}