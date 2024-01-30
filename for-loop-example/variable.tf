variable "region" {
  default = "ap-south-1"
}

variable "access-key" {
  default = "ADETB4E"
}

variable "secret-key" {
  default = "U928kQAX+"
}

variable "ami" {
  default = "ami-03f4878755434977f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "tags" {
  default = { Name = "Raman-first-terraform-instance" }
}

