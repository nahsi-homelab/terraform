locals {
  instances = toset(["heraclea", "nicomedia"])
}

resource "vultr_instance" "pontus" {
  for_each = local.instances

  hostname = each.key
  label    = each.key
  plan     = "vc2-1c-2gb"
  region   = "ams"
  os_id    = "517" # Ubuntu 21.10

  ssh_key_ids = [
    vultr_ssh_key.pergamon.id,
    vultr_ssh_key.miletos.id,
  ]

  private_network_ids = [
    vultr_private_network.pontus.id
  ]

  firewall_group_id = vultr_firewall_group.instances.id
}

resource "cloudflare_record" "pontus" {
  for_each = local.instances

  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = each.key
  value   = vultr_instance.pontus[each.key].main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "wg" {
  for_each = local.instances

  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "wireguard.pontus"
  value   = vultr_instance.pontus[each.key].main_ip
  type    = "A"
  ttl     = 1
}
