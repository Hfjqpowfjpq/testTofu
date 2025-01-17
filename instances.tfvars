test_flavors = [ 
  {
    name  = test.tiny
    ram   = 512
    vcpus = 1
    disk  = 1   
  },
  {
    name  = test.medium
    ram   = 2
    vcpus = 4
    disk  = 40   
  } 
]

test_images = [
  {
    name             = "Ubuntu-Jammy"
    image_source_url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
    container_format = "bare"
    disk_format      = "qcow2"
    visibility       = "public"
  },
  {
    name             = "Rocky-9"
    image_source_url = "https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
    container_format = "bare"
    disk_format      = "qcow2"
    visibility       = "public"
  }
]

test_instances = [
  {
    name                  = "public_vm"
    image_name            = "Ubuntu-Jammy"
    flavor_name           = "test.medium"
    key_pair              = "test-keypair"
    security_groups_names = ["default","ingress_rules"]

    network {
      name = "external_net"
    }
  },
  {
    name                  = "private_vm"
    image_name            = "Rocky-9"
    flavor_name           = "test.medium"
    key_pair              = "test-keypair"
    security_groups_names = ["default","ingress_rules"]

    network {
      name = "internal_net"
    }
  },
] 