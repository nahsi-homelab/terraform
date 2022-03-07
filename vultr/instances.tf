resource "vultr_instance" "heraclea" {
  hostname = "heraclea"
  label    = "heraclea"
  plan     = "vc2-1c-2gb"
  region   = "fra"
  os_id    = "387" # Ubuntu 20.04

  ssh_key_ids = [
    vultr_ssh_key.pergamon.id,
    vultr_ssh_key.miletos.id,
  ]

  firewall_group_id = vultr_firewall_group.main.id
}

resource "vultr_reserved_ip" "heraclea" {
  label       = "heraclea"
  region      = "fra"
  ip_type     = "v4"
  instance_id = vultr_instance.heraclea.id
}

resource "vultr_reverse_ipv4" "heraclea" {
  instance_id = vultr_instance.heraclea.id
  ip          = vultr_instance.heraclea.main_ip
  reverse     = "pontus.nahsi.dev"
}

resource "cloudflare_record" "pontus" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "pontus"
  value   = vultr_instance.heraclea.main_ip
  type    = "A"
  ttl     = 1
}
