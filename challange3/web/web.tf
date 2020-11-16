
resource "aws_instance" "web" {
  ami = "ami-0a669382ea0feb73a"
  instance_type = "t2.micro"
  tags = {
    Name = "Web Server"
  }
  security_groups = [module.sg.sg_name]

  user_data = file("./web/server-script.sh")
} 

output "pub_ip"{
  value = module.eip.PublicIP  
}

module "eip"{
  source = "../eip"
  instance_id = aws_instance.web.id
}
module "sg"{
  source = "../sg"
}