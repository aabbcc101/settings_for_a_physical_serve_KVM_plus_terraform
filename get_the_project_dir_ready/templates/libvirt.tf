#####
# Create extra network
#####

resource "libvirt_network" "test_net" {
  name      = "test_net"
#  mode      = "bridge"
#  bridge    =  "br0"
#  domain    = "test.net"
  addresses = ["10.10.10.0/24"]
  dhcp {
    enabled = true
  }
#  dns {
#    enabled = true
#  }
}

#####
# Create centos
#####
                                                  
# Defining VM Volume 
resource "libvirt_volume" "centos-qcow2" {
  name = "centos.qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "centos" {
  name   = "centos"
  memory = "1048"
  vcpu   = 1

  network_interface {
#    network_id     = "${libvirt_network.test_net.id}"
#    network_name = "${libvirt_network.test_net.name}"
#    addresses      = ["10.10.10.10"]
    network_name = "default"
    hostname       = "centos"
    addresses      = ["192.168.122.10"]
    mac            = "de:3d:c0:a8:0a:8d"
  }

  disk {
    volume_id = "${libvirt_volume.centos-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

#####

# MAIN-DEBIAN

#####
                                                  
# Defining VM Volume
resource "libvirt_volume" "main-debian-qcow2" {
  name = "main-debian.qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "./debian-12-nocloud-amd64.qcow2"
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "main-debian" {
  name   = "main-debian"
  memory = "1048"
  vcpu   = 1

  network_interface {
#    network_id     = "${libvirt_network.test_net.id}"
#    network_name = "${libvirt_network.test_net.name}"
#    addresses      = ["10.10.10.12"]
    network_name = "default"
    hostname       = "main-debian"
    addresses      = ["192.168.122.12"]
    mac            = "de:3d:c1:0a:0a:8d"
  }

  disk {
    volume_id = "${libvirt_volume.main-debian-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial" 
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}



#####

# CLOUD-DEBIAN

#####
                                                  
# Defining VM Volume

resource "libvirt_volume" "cloud-debian-qcow2" {
  name = "cloud-debian.qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "./debian-12-nocloud-amd64.qcow2"
  format = "qcow2"
}

resource "libvirt_volume" "big-cloud-debian-qcow2" {
  name           = "big-cloud-debian-qcow2"
  base_volume_id = libvirt_volume.cloud-debian-qcow2.id
  pool           = "default"
  size           = 20737418240
}

# Define KVM domain to create

resource "libvirt_domain" "cloud-debian" {
  name   = "cloud-debian"
  memory = "1048"
  vcpu   = 1

  network_interface {
#    network_id     = "${libvirt_network.test_net.id}"
#    network_name = "${libvirt_network.test_net.name}"
#    addresses      = ["10.10.10.11"]
    network_name = "default"
    hostname       = "cloud-debian"
    addresses      = ["192.168.122.11"]
    mac            = "de:3d:c0:22:0a:8d"
  }

  disk {
    volume_id = "${libvirt_volume.big-cloud-debian-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}


