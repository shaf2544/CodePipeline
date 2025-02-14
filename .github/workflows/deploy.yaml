terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Updated version
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c02fb55956c7d316" # Example updated AMI for us-east-1
  instance_type = "t1.micro" # Updated instance type

  tags = {
    Name = "Brand-new-Server"
  }
}
