resource "vultr_firewall_group" "main" {
  description = "main firewall"
}

resource "vultr_firewall_rule" "ssh" {
  firewall_group_id = vultr_firewall_group.main.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "22"
  notes             = "ssh"
}

resource "vultr_firewall_rule" "wireguard" {
  firewall_group_id = vultr_firewall_group.main.id
  protocol          = "udp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "59795"
  notes             = "wireguard"
}

resource "vultr_firewall_rule" "tailscale" {
  firewall_group_id = vultr_firewall_group.main.id
  protocol          = "udp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "41641"
  notes             = "tailscale"
}
