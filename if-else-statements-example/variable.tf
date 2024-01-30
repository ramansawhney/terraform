variable "region" {
  default = "ap-south-1"
}

variable "access-key" {
  default = "ATB4E"
}

variable "secret-key" {
  default = "UC8kQAX+"
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

variable "env" {
  description = "Enter Environment(dev/uat/prd): "
}
