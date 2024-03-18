terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "ec2_inst" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    key_name = Asfiya
  
}