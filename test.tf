provider "aws" {
	version = "~> 1.35"
}

resource "aws_instance" "test" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"

  tags {
    Name = "test"
  }

  security_groups = ["sg-a14603e9"]
  availability_zone = "us-east-1a"
  subnet_id = "subnet-2a26b260"

}
