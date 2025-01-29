test_instances = [
  {
    name                  = "controller01"
    flavor_name           = "b_boot_vm"
    key_pair              = "testkey"
    security_groups_names = ["default"]

    networks = [
      {
        name = "vm_net"
      },
      {
        name = "hyper_ext"
      },
    ]

    image_block_device = {
      uuid_name             = "Ubuntu 22.04 server"
      source_type           = "image"
      volume_size           = "32"
      boot_index            = "0"
      destination_type      = "volume"
      delete_on_termination = true
    }

    auxiliary_block_devices = [
    ]
  },
  {
    name                  = "storage01"
    flavor_name           = "m_boot_vm"
    key_pair              = "testkey"
    security_groups_names = ["default"]

    networks = [
      {
        name = "vm_net"
      },
      {
        name = "hyper_ext"
      },
    ]

    image_block_device = {
      uuid_name             = "Ubuntu 22.04 server"
      source_type           = "image"
      volume_size           = "32"
      boot_index            = "0"
      destination_type      = "volume"
      delete_on_termination = true
    }

    auxiliary_block_devices = [
    ]
  },
  {
    name                  = "storage02"
    flavor_name           = "m_boot_vm"
    key_pair              = "testkey"
    security_groups_names = ["default"]

    networks = [
      {
        name = "vm_net"
      },
      {
        name = "hyper_ext"
      },
    ]

    image_block_device = {
      uuid_name             = "Ubuntu 22.04 server"
      source_type           = "image"
      volume_size           = "32"
      boot_index            = "0"
      destination_type      = "volume"
      delete_on_termination = true
    }

    auxiliary_block_devices = [
    ]
  },
  {
    name                  = "storage03"
    flavor_name           = "m_boot_vm"
    key_pair              = "testkey"
    security_groups_names = ["default"]

    networks = [
      {
        name = "vm_net"
      },
      {
        name = "hyper_ext"
      },
    ]

    image_block_device = {
      uuid_name             = "Ubuntu 22.04 server"
      source_type           = "image"
      volume_size           = "32"
      boot_index            = "0"
      destination_type      = "volume"
      delete_on_termination = true
    }

    auxiliary_block_devices = [
    ]
  },
] 