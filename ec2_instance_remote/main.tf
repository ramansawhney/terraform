terraform {
  backend "local" {
    path = "/etc/mystatefile"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "FX"
  secret_key = "onn"
}

resource "aws_instance" "example" {
  ami = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  tags = {
    Name = "Raman-vm-new"
  }
}
