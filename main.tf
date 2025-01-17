terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  user_name           = var.connection.user_name
  tenant_name         = var.connection.tenant_name
  project_domain_name = var.connection.project_domain_name
  password            = var.connection.password
  auth_url            = var.connection.auth_url
  region              = var.connection.region
}