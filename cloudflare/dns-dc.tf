resource "cloudflare_record" "syria" {
  zone_id = var.cloudflare_zone_id
  name    = "syria"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "asia" {
  zone_id = var.cloudflare_zone_id
  name    = "asia"
  value   = var.asia
  type    = "A"
  ttl     = 1
}
