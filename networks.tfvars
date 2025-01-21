test_networks = [
  {
    name     = "external-net"
    external = true
    segments = {
      network_type     = "flat"
      physical_network = "physnet1"
    }

  },
  {
    name = "internal-net"
  },
]

test_subnets = [
  {
    name            = "external-subnet"
    network_name    = "external-net"
    cidr            = "192.168.33.0/24"
    gateway_ip      = "192.168.33.3"
    dns_nameservers = ["8.8.8.8","8.8.4.4","1.1.1.1"]
    enable_dhcp     = true
    allocation_pool = {
      start = "192.168.33.10"
      end   = "192.168.33.100"
    }

  },
  {
    name            = "internal-subnet"
    network_name    = "internal-net"
    cidr            = "10.10.10.0/24"
    gateway_ip      = "10.10.10.1"
    dns_nameservers = ["8.8.8.8","8.8.4.4","1.1.1.1"]
    enable_dhcp     = true
    allocation_pool = {
      start = "10.10.10.2"
      end   = "10.10.10.254"
    }

  },
]

ext_router = {
  name                  = "ext_router"
  enable_snat           = "true"
  external_network_name = "external-net"
  internal_subnet_name  = "internal-subnet"
}