resource "linode_instance" "narona" {
  label  = "narona"
  image  = "linode/gentoo"
  region = "eu-central"
  type   = "g6-standard-2"

  authorized_users = ["nahsi"]
}

resource "linode_firewall" "main" {
  label = "main"

  inbound {
    label    = "allow-ssh"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
  }

  inbound {
    label    = "allow-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::0/0"]
  }

  inbound {
    label    = "allow-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::0/0"]
  }

  inbound {
    label    = "wireguard"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "59795"
    ipv4 = [
      "91.245.37.33/32", # syria
      "81.23.150.126/32" # asia
    ]
  }

  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  linodes = [linode_instance.narona.id]
}

resource "namecheap_domain_records" "dalmatia" {
  domain = "nahsi.dev"
  mode   = "MERGE"

  record {
    hostname = "dalmatia"
    type     = "A"
    address  = linode_instance.narona.ip_address
  }

  record {
    hostname = "narona"
    type     = "A"
    address  = linode_instance.narona.ip_address
  }
}
