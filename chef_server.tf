provider "aws" {
  version = "~> 1.35"
  region = "${var.aws_region}"
}

resource "aws_security_group" "chef_sg" {
  name 		= "{var.tag_name}-SG"
  description 	= "Allow inbound traffic from home only"
  vpc_id      	= "${var.vpc_prod_id}"

  ingress {
    from_port	= 22
    to_port	= 22
    protocol	= "tcp"
    cidr_blocks	= ["{var.cidr_access}"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["{var.cidr_access}"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["{var.cidr_access}"]
  }
  
  egress {
    from_port 	= 0
    to_port 	= 0
    protocol 	= "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name 	= "{var.tag_name}-SG"
    owner	= "{var.tag_owner}"
    env		= "{var.tag_env}"
    builder	= "{var.tag_builder}"
  }
}

resource "aws_instance" "chef_server" {
  ami           		= "${var.aws_ami}"
  instance_type 		= "${var.instance_type}"
  vpc_security_group_ids 	= ["${aws_security_group.chef_sg.id}"]
  key_name			= "${var.key_name}"  
  availability_zone 		= "${var.az_id}"
  subnet_id 			= "${var.subnet_id}" 
  associate_public_ip_address 	= true
  user_data			= "${file("chef_server.sh")}"
 
  tags {
    Name 	= "{var.tag_name}-{var.tag_env}"
    owner	= "{var.tag_owner}"
    env		= "{var.tag_env}"
    builder	= "{var.tag_builder}"
  }
}

