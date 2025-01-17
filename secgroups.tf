resource "openstack_networking_secgroup_v2" "my_secgroup" {
  for_each = { for entry in var.test_secgroups : "${entry.name}" => entry }

  name        = each.value.name
  description = each.value.description
  
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_rules" {
  for_each = { for entry in var.test_associations : "${entry.name}" => entry }
  
  security_group_id = openstack_networking_secgroup_v2.my_secgroup[each.value.secgroup_name].id

  ## VEDERE COME FARE NESTED FOR EACH

  name              = each.value.name
  direction         = each.value.direction
  ethertype         = each.value.ethertype
  protocol          = each.value.protocol
  port_range_min    = each.value.port_range_min
  port_range_max    = each.value.port_range_max
  remote_ip_prefix  = each.value.remote_ip_prefix
  security_group_id = openstack_networking_secgroup_v2.my_secgroup.id
}