variable "test_secgroups" {
  type = list(object({
    name        = string
    description = optional(string)
  }))
}

variable "single_rules" {
  type = list(object({
    name             = string
    direction        = string
    ethertype        = string
    protocol         = string
    port_range_min   = optional(string)
    port_range_max   = optional(string)
    remote_ip_prefix = string
    security_group_names = list(string)
    }))
}
