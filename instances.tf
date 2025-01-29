data "openstack_images_image_v2" "image" {
  for_each = { for entry in var.test_instances : entry.image_block_device.uuid_name => entry.image_block_device.uuid_name }
  name     = each.key
}

data "openstack_compute_flavor_v2" "flavor" {
  for_each = { for entry in var.test_instances : entry.flavor_name => entry.flavor_name }
  name     = each.key
}

data "openstack_compute_keypair_v2" "keypair" {
  for_each = { for entry in var.test_instances : entry.key_pair => entry.key_pair }
  name     = each.key
}

resource "openstack_compute_instance_v2" "instances" {
  for_each = { for entry in var.test_instances : entry.name => entry }
  name            = each.value.name
  flavor_id       = data.openstack_compute_flavor_v2.flavor[each.value.flavor_name].id
  key_pair        = each.value.key_pair
  security_groups = each.value.security_groups_names

  network {
    name = each.value.network.name
  }

  block_device {
    uuid                  = data.openstack_images_image_v2.image[each.value.image_block_device.uuid_name].id
    source_type           = each.value.image_block_device.source_type
    volume_size           = each.value.image_block_device.volume_size
    boot_index            = each.value.image_block_device.boot_index
    destination_type      = each.value.image_block_device.destination_type
    delete_on_termination = each.value.image_block_device.delete_on_termination
  }

    dynamic "block_device" {
    for_each = each.value.auxiliary_block_devices
    content {
      source_type           = block_device.value.source_type
      volume_size           = block_device.value.volume_size
      boot_index            = block_device.value.boot_index
      destination_type      = block_device.value.destination_type
      delete_on_termination = block_device.value.delete_on_termination
    }
  }
}
