resource "vultr_instance" "heraclea" {
  label  = "heraclea"
  plan   = "vc2-1c-2gb"
  region = "ams"
  os_id  = "517" # Ubuntu 21.10

  ssh_key_ids = [
    vultr_ssh_key.pergamon.id,
    vultr_ssh_key.miletos.id,
  ]

  firewall_group_id = vultr_firewall_group.main.id
}

resource "cloudflare_record" "pontus" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "pontus"
  value   = vultr_instance.heraclea.main_ip
  type    = "A"
  ttl     = 1
}
