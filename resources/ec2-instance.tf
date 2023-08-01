# create a resource EC2  
    resource "aws_instance" "web" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"
    availability_zone = "us-east-1b"
    tags = {
        "Name" = "Web-Server"
    }
}

resource "aws_instance" "web" {
  ami = "ami-0f9ce67dcf718d332"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
    "env" = "QA"
  }
}