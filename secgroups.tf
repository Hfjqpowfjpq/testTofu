resource "openstack_networking_secgroup_v2" "my_secgroup" {
  for_each = { for entry in var.test_secgroups : entry.name => entry }

  name        = each.value.name
  description = each.value.description
}

resource "openstack_networking_secgroup_rule_v2" "my_rules" {
  
}