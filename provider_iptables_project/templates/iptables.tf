provider "iptables" {
  firewall_ip         = "192.168.1.12"
  port                = 8443
  allowed_cidr_blocks = ["0.0.0.0/0"]
#  https               = true
#  insecure            = true
#  vault_enable        = true
}

#resource iptables_project theproject {
#  name        = "WARD"
#  cidr_blocks = ["192.168.1.0/24"]
#}

# resource iptables_rules rules-front {
#  name           = "rules-front"
#  project        = "FORWARD"
#  on_cidr_blocks = ["192.168.1.12"]
#  ingress {
#    protocol = "6"
#    to_port  = "11022"
#    from_port = "22"
#    cidr_blocks = ["192.168.10.2"]    
#  }
#}

resource iptables_rules rules-front {
  name           = "rules-front"
  project        = "FORWARD"
  on_cidr_blocks = ["192.168.10.2"]
  ingress {
    protocol = "tcp"
    to_port  = "22"
    state = "NEW"
    action = "ACCEPT"
  }
}

resource iptables_nat dnat-front_http {
  name           = "dnat-front_http"
  on_cidr_blocks = ["192.168.1.12"]
  dnat {
    iface    = "enp4s0"
    protocol = "tcp"
    to_port  = "30555"
    nat_ip   = "192.168.10.2:22"
  }
}
