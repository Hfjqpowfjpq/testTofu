variable "test_secgroups" {
  type = list(object({
    name        = string
    description = optional(string)
  }))
}

variable "test_associations" {
  type = list(object({
      secgroup_name = string
      rules          = list(string) 
  }))
}

variable "test_rules" {
  type = list(object({
    name             = string
    direction        = string
    ethertype        = string
    protocol         = string
    port_range_min   = optional(string)
    port_range_max   = optional(string)
    remote_ip_prefix = string
  }))
}