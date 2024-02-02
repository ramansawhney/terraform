module "calling-module" {
  source = "/root/terraform-learning/modules-terraform"
  instance_type = "t2.small"
  access-key = "7H"
  secret-key = "QH"
}


output "mypublicips" {
  value = module.calling-module.ec2_public_ips
}

