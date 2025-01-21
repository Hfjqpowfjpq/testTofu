resource "openstack_networking_secgroup_v2" "my_secgroup" {
  for_each = { for entry in var.test_secgroups : entry.name => entry }

  name        = each.value.name
  description = each.value.description
}

resource "openstack_networking_secgroup_rule_v2" "my_rules" {
  for_each = { for rule in var.single_rules : "${rule.name}-${rule.security_group_names[0]}" => rule }

  direction         = each.value.direction
  ethertype         = each.value.ethertype
  protocol          = each.value.protocol
  port_range_min    = try(each.value.port_range_min, null) # Use 'try' to handle optional fields
  port_range_max    = try(each.value.port_range_max, null)
  remote_ip_prefix  = each.value.remote_ip_prefix

  # Find the security group ID by matching the name
  security_group_id = openstack_networking_secgroup_v2.my_secgroup[each.value.security_group_names[0]].id
}