variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "size" {
  default = "e2-micro"
}

variable "tag" {
  default = "raman-web"
}

variable "image" {
  default = "centos-7"
}

variable "network" {
  default = "default"
}

variable "user" {
  default = "adminuser"
}

variable pubkey {
  default = "/root/.ssh/id_rsa.pub"
}


