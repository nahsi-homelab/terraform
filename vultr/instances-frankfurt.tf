resource "vultr_private_network" "private-fra" {
  description    = "fra private"
  region         = "fra"
  v4_subnet      = "10.4.10.0"
  v4_subnet_mask = "24"
}

resource "vultr_instance" "chalcedon" {
  hostname = "chalcedon"
  label    = "chalcedon"
  plan     = "vc2-1c-1gb"
  region   = "fra"
  os_id    = "517" # Ubuntu 21.10

  ssh_key_ids = [
    vultr_ssh_key.pergamon.id,
    vultr_ssh_key.miletos.id,
  ]

  private_network_ids = [
    vultr_private_network.private-fra.id,
  ]

  firewall_group_id = vultr_firewall_group.instances.id
}

resource "cloudflare_record" "chalcedon" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "chalcedon"
  value   = vultr_instance.chalcedon.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "pontus-fra" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "pontus"
  value   = vultr_instance.chalcedon.main_ip
  type    = "A"
  ttl     = 1
}
