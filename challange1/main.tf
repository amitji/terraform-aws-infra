provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "challange1Vpc" {
  cidr_block = "92.168.0.0/24"
  tags = {
    Name = "TerraformVPC"
  }
}