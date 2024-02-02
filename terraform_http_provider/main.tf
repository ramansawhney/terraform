terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
      version = "3.4.1"
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

data "http" "example" {
  url = "https://checkpoint-api.hashicorp.com/v1/check/terraform"
  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  mydata = "${jsondecode(data.http.example.response_body)}"
}

resource "local_file" "example" {
  content = local.mydata.current_version
  filename = "${path.module}/myversion"
}


