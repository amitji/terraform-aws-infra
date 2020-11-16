provider "aws" {
  region="eu-west-2"
}

resource "aws_instance" "db" {
  ami = "ami-0a669382ea0feb73a"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
  
} 

resource "aws_instance" "web" {
  ami = "ami-0a669382ea0feb73a"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
  security_groups = [aws_security_group.webTraffic.name]

  user_data = file("server-script.sh")
} 

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}



variable "ingressrules" {
  type = list(number)
  default = [80, 443]
}

variable "egressrules" {
  type = list(number)
  default = [80, 443]
}


resource "aws_security_group" "webTraffic" {
  name = "Allow Web Traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"] 
    }
  }
 
  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"] 
    }
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}
output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}

