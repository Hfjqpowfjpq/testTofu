test_secgroups = [
  {
    name        = "ingress_rule"
    description = "Enabled ingress SSH and ICMP"
  },
]

single_rules = [
  {
    name              = "ssh"
    direction         = "ingress"
    ethertype         = "IPv4"
    protocol          = "tcp"
    port_range_min    = 22
    port_range_max    = 22
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_names = ["ingress_rule"]
  },
  {
    name              = "icmp"
    direction         = "ingress"
    ethertype         = "IPv4"
    protocol          = "icmp"
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_names = ["ingress_rule"]
  },
]
