resource "vultr_firewall_group" "instances" {
  description = "instances"
}

resource "vultr_firewall_rule" "ssh" {
  firewall_group_id = vultr_firewall_group.instances.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "22"
  notes             = "ssh"
}

resource "vultr_firewall_rule" "innernet" {
  firewall_group_id = vultr_firewall_group.instances.id
  protocol          = "udp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "50820"
  notes             = "innernet"
}

resource "vultr_firewall_rule" "wg-relay" {
  firewall_group_id = vultr_firewall_group.instances.id
  protocol          = "udp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "51820"
  notes             = "wireguard relay"
}

resource "vultr_firewall_rule" "wg-common" {
  firewall_group_id = vultr_firewall_group.instances.id
  protocol          = "udp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "52820"
  notes             = "wireguard common"
}
