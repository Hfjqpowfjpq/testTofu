test_instances = [
  {
    name                  = "controller01"
    flavor_name           = "b_boot_vm"
    key_pair              = "testkey"
    security_groups_names = ["default"]

    networks = [
      {
        name = "vm_net"
        fixed_ip_v4 = "10.0.1.102"
      },
      {
        name = "hyper_ext"
        fixed_ip_v4 = "10.0.3.94"
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
        fixed_ip_v4 = "10.0.1.117"
      },
      {
        name = "hyper_ext"
        fixed_ip_v4 = "10.0.3.149"
      },
    ]

    image_block_device = {
      uuid_name             = "Ubuntu 22.04 server"
      source_type           = "image"
      volume_size           = "16"
      boot_index            = "0"
      destination_type      = "volume"
      delete_on_termination = true
    }

    auxiliary_block_devices = [
      {
        source_type           = "blank"
        volume_size           = "32"
        boot_index            = "1"
        destination_type      = "volume"
        delete_on_termination = true
      },
      {
        source_type           = "blank"
        volume_size           = "32"
        boot_index            = "2"
        destination_type      = "volume"
        delete_on_termination = true
      },
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
        fixed_ip_v4 = "10.0.1.12"
      },
      {
        name = "hyper_ext"
        fixed_ip_v4 = "10.0.3.135"
      },
    ]

    image_block_device = {
      uuid_name             = "Ubuntu 22.04 server"
      source_type           = "image"
      volume_size           = "16"
      boot_index            = "0"
      destination_type      = "volume"
      delete_on_termination = true
    }

    auxiliary_block_devices = [
      {
        source_type           = "blank"
        volume_size           = "32"
        boot_index            = "1"
        destination_type      = "volume"
        delete_on_termination = true
      },
      {
        source_type           = "blank"
        volume_size           = "32"
        boot_index            = "2"
        destination_type      = "volume"
        delete_on_termination = true
      },
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
        fixed_ip_v4 = "10.0.1.87"
      },
      {
        name = "hyper_ext"
        fixed_ip_v4 = "10.0.3.131"
      },
    ]

    image_block_device = {
      uuid_name             = "Ubuntu 22.04 server"
      source_type           = "image"
      volume_size           = "16"
      boot_index            = "0"
      destination_type      = "volume"
      delete_on_termination = true
    }

    auxiliary_block_devices = [
      {
        source_type           = "blank"
        volume_size           = "32"
        boot_index            = "1"
        destination_type      = "volume"
        delete_on_termination = true
      },
      {
        source_type           = "blank"
        volume_size           = "32"
        boot_index            = "2"
        destination_type      = "volume"
        delete_on_termination = true
      },
    ]
  },
] 