resource "cloudflare_record" "assets" {
  zone_id = var.cloudflare_zone_id
  name    = "assets"
  value   = "f003.backblazeb2.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
