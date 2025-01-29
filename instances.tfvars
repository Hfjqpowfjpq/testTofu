test_instances = [
  {
    name                  = "temporarytester"
    flavor_name           = "m4.small"
    key_pair              = "hfjKey"
    security_groups_names = ["default","SSH_ping"]

    network = {
      name = "medooza-dev-net"
    }

    image_block_device = {
      uuid_name             = "Rocky-8-GenericCloud-LVM.x86_64"
      source_type           = "image"
      volume_size           = "30"
      boot_index            = "0"
      destination_type      = "volume"
      delete_on_termination = true
    }

    auxiliary_block_devices = [
      {
        source_type           = "blank"
        volume_size           = "100"
        boot_index            = "1"
        destination_type      = "volume"
        delete_on_termination = true
      },
    ]
  },
] 