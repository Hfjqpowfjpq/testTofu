resource "openstack_networking_network_v2" "networks" {
  for_each = { for entry in var.test_networks : "${entry.name}" => entry }

  name     = each.value.name
  external = each.value.external

  dynamic "segments" {
    for_each = each.value.segments != null ? [0] : []
    content {
      network_type     = each.value.segments.network_type
      physical_network = each.value.segments.physical_network
      segmentation_id  = each.value.segments.segmentation_id != null ? each.value.segments.segmentation_id : null
    }

  }
}

resource "openstack_networking_subnet_v2" "subnets" {
  for_each = { for entry in var.test_subnets : "${entry.name}" => entry }

  name            = each.value.name
  network_id      = openstack_networking_network_v2.networks[each.value.network_name].id
  cidr            = each.value.cidr
  enable_dhcp     = each.value.enable_dhcp
  dns_nameservers = each.value.dns_nameservers
  gateway_ip      = each.value.gateway_ip

  allocation_pool {
    start = each.value.allocation_pool.start
    end   = each.value.allocation_pool.end
  }
}

resource "openstack_networking_router_v2" "external_router" {
  name                = var.ext_router.name
  enable_snat         = var.ext_roter.enable_snat
  external_network_id = openstack_networking_network_v2.networks[var.ext_router.external_network_name].id
}

resource "openstack_networking_router_interface_v2" "router_internal_interface" {
  router_id = openstack_networking_router_v2.ext_router.id
  subnet_id = openstack_networking_subnet_v2.subnets[var.ext_roter.internal_subnet_name].id
}