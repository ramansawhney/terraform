variable "region" {
  default = "ap-south-1"
}

variable "access-key" {
  default = "AKTB4E"
}

variable "secret-key" {
  default = "UCkQAX+"
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

