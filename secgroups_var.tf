variable "medooza_secgroups" {
  type = list(object({
    name        = string
    description = optional(string)
    rules = list(object({
      name             = string
      direction        = string
      ethertype        = string
      protocol         = string
      port_range_min   = optional(string)
      port_range_max   = optional(string)
      remote_ip_prefix = string
    }))
  }))
}