variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Desired instance type for EC2"
  default = "t2.medium"
}

# CentOS 7 AMI
variable "aws_ami" {
  description = "Image Id"
  default = "ami-0eaf7f3ca4d177abb"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "terraform"
}

variable "vpc_prod_id" {
  description = "Production VPC ID"
  default = "vpc-ce4b4eb5"
}

variable "subnet_id" {
  description = "Subnet ID to use"
  default = "subnet-07f4345b"
}

variable "cidr_access" {
  type = "list"
  description = "CIDR of originating traffic"
  default = ["100.4.210.205/32"]
}

variable "az_id" {
  description = "Availability Zone"
  default = "us-east-1b"
}

variable "public_ip" {
  description = "Associate ec2 instance wth Public IP"
  default = true
}

variable "tag_name" {
  description = "Name tag value"
  default = "CHEF-SERVER"
}


variable "tag_owner" {
  description = "Owner tag value"
  default = "Andy Lalla"
}

variable "tag_env" {
  description = "Environment tag value"
  default = "PROD"
}


variable "tag_builder" {
  description = "Provisioning tool tag value"
  default = "Terraform"
}
