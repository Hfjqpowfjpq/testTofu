variable "test_instances" {
  type = list(object({
    name                  = string
    flavor_name           = string
    key_pair              = string
    security_groups_names = list(string)
    networks = list(object({
      name = string
    }))
    image_block_device = object({
      uuid_name             = string
      source_type           = string
      volume_size           = string
      boot_index            = string
      destination_type      = string
      delete_on_termination = bool
    })
    auxiliary_block_devices = list(object({
      source_type           = string
      volume_size           = string
      boot_index            = string
      destination_type      = string
      delete_on_termination = bool
    }))
  }))
}
