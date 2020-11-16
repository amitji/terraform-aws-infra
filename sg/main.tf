provider "aws" {
  region="eu-west-2"
}

resource "aws_instance" "ec2Instance" {
  ami = "ami-0a669382ea0feb73a"
  instance_type = "t2.micro"
  tags = {
    Name = "amit_tf_ec2_111"
  }
  security_group = [aws_security_group.webTraffic.name]
} 

resource "aws_security_group" "webTraffic" {
  name = "Allow HTTPS"
  ingress{
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
   from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }

}