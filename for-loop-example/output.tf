output "MyPublicIP" {
  value = [
    for x in ["dev", "uat", "prd"]:
      aws_instance.web[x].public_ip
  ]
}

output "publicIP" {
  value = [
    for x in keys(aws_instance.web):
      aws_instance.web[x].public_ip
  ]
}

