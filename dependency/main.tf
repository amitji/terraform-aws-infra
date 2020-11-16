provider "aws" {
  region="eu-west-2"
}

resource "aws_instance" "db" {
  ami = "ami-0a669382ea0feb73a"
  instance_type = "t2.micro"
  tags = {
    Name = "amit_tf_db"
  }
} 

resource "aws_instance" "web" {
  ami = "ami-0a669382ea0feb73a"
  instance_type = "t2.micro"
  tags = {
    Name = "amit_tf_web"
  }
  depends_on = [aws_instance.db]
} 

data "aws_instance" "db_search"{
  filter {
    name = "tag:Name"
    values = ["amit_tf_db"]
  }
}

output "DB_Servers" {
  value = data.aws_instance.db_search.availability_zone
}
