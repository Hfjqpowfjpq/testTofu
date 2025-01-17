variable "test_key" {
  type = object({
    name = string
    key  = string
  })

  default = {
    name = "test-keypair"
    key  = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKLnRMWBYI/qWPOLF/x4C3gbhDVV3E89o3hqDuBQpc4h"
  }
}

variable "test_flavors" {
    type = list(object({
      name  = string
      ram   = string
      vcpus = string
      disk  = string
    }))
}

variable "test_images" {
    type = list(object({
      name             = string
      image_source_url = string
      container_format = string
      disk_format      = string
      visibility       = string
    }))
}

variable "test_instances" {
    type = list(object({
      name                  = string
      image_name            = string
      flavor_name           = string
      key_pair              = string
      security_groups_names = list(string)
      network = object({
        name = string
      })
    }))
}