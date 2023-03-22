terraform {
  required_version = ">= 1.3.0"

  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = ">= 0.11.20"
    }
  }
}
provider "volterra" {
  api_cert = var.api_cert
  api_key  = var.api_key
  url      = "https://${var.f5xc_tenant_name}.console.ves.volterra.io/api"
}


