terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}

# EC2 instance
 resource "aws_instance" "ec2demo" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type= "t2.micro"
 }