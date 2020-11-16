resource "aws_instance" "db" {
  ami = "ami-0a669382ea0feb73a"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
  
} 

output "PrivateIP" {
  value = aws_instance.db.private_ip
}