terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "AKX"
  secret_key = "AWnn"
}

import { 
  to = aws_instance.myserver
  id = "i-0b0c20dac5ebc9f0d"
}

