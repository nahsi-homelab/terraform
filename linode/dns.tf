data "cloudflare_zones" "domain" {
  filter {
    name = "nahsi.dev"
  }
}

resource "cloudflare_record" "pontus" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "pontus"
  value   = linode_instance.heraclea.ip_address
  type    = "A"
  ttl     = 1
}

resource "linode_rdns" "pontus" {
  address = linode_instance.heraclea.ip_address
  rdns    = "pontus.nahsi.dev"
}
