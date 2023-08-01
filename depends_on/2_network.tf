# Creating a vpc

resource "aws_vpc" "tf_vpc_new" {
    cidr_block = "10.1.0.0/16"
    tags = {
    "Name" = "Production VPC"
    }
}

# Create a subnet to the vpc in step 1

resource "aws_subnet" "tf_public_subnet-1" {
  vpc_id     = aws_vpc.tf_vpc_new.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true # false
  tags = {
    "Name" = "prod-public-subnet-1"
  }
}

# Creating a igw in my custom vpc
resource "aws_internet_gateway" "tf_vpc_igw" {
  vpc_id = aws_vpc.tf_vpc_new.id

  tags = {
    Name = "prod-public-igw"
  }
}

# creating a route table in my custom vpc
resource "aws_route_table" "tf_rt_public" {
  vpc_id = aws_vpc.tf_vpc_new.id
}

# We need to create a route in Routes option to get internet
# We need to explicitly mention the IGW
resource "aws_route" "tf_aws_public_route" {
  route_table_id = aws_route_table.tf_rt_public.id
  gateway_id = aws_internet_gateway.tf_vpc_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# We need to create a subnet association in Routing table
# Map/Associate the subnet created with Route Table
resource "aws_route_table_association" "tf_rt_public_association" {
  subnet_id      = aws_subnet.tf_public_subnet-1.id
  route_table_id = aws_route_table.tf_rt_public.id
}

# Creating security groups to login into linux vms 
# To access webserver
# Need to open port 22 and port 80 to internet 0.0.0.0/0
resource "aws_security_group" "tf_sg_new" {
    name        = "production-vpc-sg"
    description = "Allow SSH and HTTP"
    vpc_id      = aws_vpc.tf_vpc_new.id
    ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0./0"]
  }
  ingress {
    description = "allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0./0"]
  }
  # In Console we no need to create egress/outbound explicitly
  # But in Terraform we need to mention the outbound compulsory
egress {
    description = "Allow all ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
