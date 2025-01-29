variable "connection" {
  type = object({
    user_name           = string
    tenant_name         = string
    tenant_id           = string
    project_domain_name = string
    password            = optional(string)
    auth_url            = string
    region              = string
    ca_cert_path        = string
  })
}
