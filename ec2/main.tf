provider "aws" {
  region="eu-west-2"
}

resource "aws_instance" "ec2Instance" {
  ami = "ami-0a669382ea0feb73a"
  instance_type = "t2.micro"
  tags = {
    Name = "amit_tf_ec2_111"
  }
} 