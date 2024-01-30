terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKI4E"
  secret_key = "UC9QAX+"
}

resource "aws_instance" "web" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"

  tags = {
    Name = "Raman-first-terraform-instance"
  }
}
