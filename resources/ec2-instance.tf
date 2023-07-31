# create a resource EC2
resource "aws_instance" "tf_my_ec2" {
    ami = "ami-0a859ac6702d2523b"
    instance_type = "t2.micro"
    availability_zone = "us-east-1b"
    tags = {
        "Name" = "Web-Server"
    }
}