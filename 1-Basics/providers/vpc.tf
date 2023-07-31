# Creation of AWS resources

resource "aws_vpc" "vpc" {
    cidr_block = "10.1.0.0/16"
    tags = {
    "Name" = "main VPC"
    }
}

# Multi Provider Block

resource "aws_vpc" "vpc-west" {
    cidr_block = "10.2.0.0/16"
    tags = {
    "Name" = "New west VPC"
    }
    provider = aws.aws-west-1   
}
