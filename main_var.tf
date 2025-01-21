variable "connection" {
  type = object({
    user_name           = string
    tenant_name         = string
    project_domain_name = string
    password            = string
    auth_url            = string
    region              = string
  })

  default = {
    user_name           = "admin"
    tenant_name         = "admin"
    project_domain_name = "admin"
    password            = "04sQWfhNTJuTkqtCU8NOKINsKQE2HpvO4jZt1AnZ"
    auth_url            = "http://10.0.1.132:5000"
    region              = "RegionOne"
  }
}