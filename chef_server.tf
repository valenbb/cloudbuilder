provider "aws" {
  version = "~> 1.35"
  region = "us-east-1"
}

resource "aws_security_group" "chef_sg" {
  name 		= "CHEF-SERVER-SG"
  description 	= "Allow inbound traffic from home only"
  vpc_id      	= "vpc-ce4b4eb5"

  ingress {
    from_port	= 22
    to_port	= 22
    protocol	= "tcp"
    cidr_blocks	= "100.4.210.205/32"
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "100.4.210.205/32"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = "100.4.210.205/32"
  }
  
  egress {
    from_port 	= 0
    to_port 	= 0
    protocol 	= "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name 	= "CHEF-SERVER-SG"
    owner	= "Andy Lalla"
    env		= "prd"
    builder	= "terraform"
  }
}

resource "aws_instance" "chef_server" {
  ami           		= "ami-04169656fea786776"
  instance_type 		= "t2.medium"
  vpc_security_group_ids 	= ["${aws_security_group.chef_sg.id}"]
  key_name			= "terraform"  
  availability_zone 		= "us-east-1b"
  subnet_id 			= "subnet-07f4345b" 
  associate_public_ip_address 	= true
  user_data			= "${file("chef_server.sh")}"
 
  tags {
    Name 	= "CHEF-SERVER-PRD"
    owner	= "Andy Lalla"
    env		= "prd"
    builder	= "terraform" 
  }
}

