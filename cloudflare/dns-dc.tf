resource "cloudflare_record" "syria" {
  zone_id = var.cloudflare_zone_id
  name    = "syria"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "mx-syria" {
  zone_id  = var.cloudflare_zone_id
  name     = "nahsi.dev"
  value    = "syria.nahsi.dev"
  type     = "MX"
  priority = "10"
  ttl      = 3600
}

resource "cloudflare_record" "asia" {
  zone_id = var.cloudflare_zone_id
  name    = "asia"
  value   = var.asia
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "mx-asia" {
  zone_id  = var.cloudflare_zone_id
  name     = "nahsi.dev"
  value    = "asia.nahsi.dev"
  type     = "MX"
  priority = "20"
  ttl      = 3600
}
