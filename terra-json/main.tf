locals {
#get json
data = jsondecode(file("${path.module}/mydata.json"))
anothervar = "abc"
}

output "printenv" {
  value = local.data
}

output "printdevuser" {
  value = local.data.project[0].user_name
}

output "printprdenv" {
  value = local.data.project[1].env
}

output "anothervarout" {
  value = local.anothervar
}

output "names" {
  value = [
    for i in local.data.project:
      "${i.env} ${i.user_name}"
  ]
}

