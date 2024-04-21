provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "app-vpc"
  }
}

resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.0.0/24"


  tags = {
    Name = "main_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "igw"
  }
}


resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.route_table.id
}


resource "aws_instance" "main_instance" {
  ami                         = "ami-080e1f13689e07408"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.main_subnet.id
  key_name                    = "key-lambda"  
  associate_public_ip_address = true

  tags = {
    Name = "MyEC2Instance"

  }
  security_groups = [aws_security_group.my_security_group.id]
}

resource "local_file" "public_ip_file" {
  filename = "inventory"
  content  = aws_instance.main_instance.public_ip
}

resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "My security group for EC2 instance"
  vpc_id      = aws_vpc.main_vpc.id



  # Define ingress rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define ingress rules
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define ingress rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

