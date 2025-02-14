terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 4.16"
}
}
required_version = ">= 1.2.0"
}
provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "app_server" {
ami = "ami-053a45fff0a704a47" # Ensure this AMI ID is valid for the region
instance_type = "t2.micro" # t1.micro is an old type, you might want to use t2.micro or another available instance type
tags = {
Name = "test-server"
}
} 
