terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "instance" {
  ami           = "ami-0ba259e664698cbfc"
  instance_type = "t2.micro"

  tags = {
    Name = "Hello-ASFIYA"
  }
}
