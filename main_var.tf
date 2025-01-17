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
    password            = "kHoeDEr87oLWsvRHVXdPC5XA4uavju0aFz1gCt2Q"
    auth_url            = "http://192.168.33.2:5000"
    region              = "RegionOne"
  }
}