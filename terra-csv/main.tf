locals {
  #get csv
  data = csvdecode(file("${path.module}/mydata.csv"))
  anothervar = "abc"
}

output "printenv" {
  value = local.data
}

output "printdevuser" {
  value = local.data.0.user_name
}

output "printprd" {
  value = local.data.1.env
}

output "anothervarout" {
  value = local.anothervar
}

output "names" {
  value = [
    for i in local.data:
      "${i.env} ${i.user_name}"
  ]
}
