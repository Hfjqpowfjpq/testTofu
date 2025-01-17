resource "openstack_compute_keypair_v2" "test-keypair" {
  name       = var.test_key.name
  public_key = var.test_key.key
}

resource "openstack_compute_flavor_v2" "flavors" {
  for_each = { for entry in var.test_flavors : "${entry.name}" => entry }
  
  name  = each.value.name
  ram   = each.value.ram
  vcpus = each.value.vcpus
  disk  = each.value.disk
}

resource "openstack_images_image_v2" "images" {
  for_each = { for entry in var.test_images : "${entry.name}" => entry }
  
  name             = each.value.name
  image_source_url = each.value.image_source_url
  container_format = each.value.container_format
  disk_format      = each.value.disk_format
  visibility       = each.value.visibility
}

resource "openstack_compute_instance_v2" "instances" {
  for_each = { for entry in var.test_instances : "${entry.name}" => entry }
  
  name            = each.value.name
  image_id        = openstack_images_image_v2.images[each.value.image_name].id
  flavor_id       = openstack_compute_flavor_v2.flavors[each.value.flavor_name].id
  key_pair        = each.value.keypair
  security_groups = each.value.visibility
  network = {
    name = each.value.network.name
  }
}