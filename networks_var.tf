variable "test_networks" {
  type = list(object({
    admin_state_up = optional(string, true)
    name           = string
    external       = optional(bool, false)
    segments = optional(object({
      network_type     = string
      physical_network = string
      segmentation_id  = optional(string, null)
    }))
  }))
}

variable "test_subnets" {
  type = list(object({
    name            = string
    network_name    = string
    cidr            = string
    enable_dhcp     = bool
    dns_nameservers = optional(list(string))
    gateway_ip      = optional(string)
    allocation_pool = object({
      start = string
      end   = string
    })
  }))
}

variable "ext_router" {
  type = object({
    name                = string
    external_network_id = string
  })
}