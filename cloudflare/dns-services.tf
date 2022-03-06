resource "cloudflare_record" "main-syria" {
  zone_id = var.cloudflare_zone_id
  name    = "nahsi.dev"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "blog-syria" {
  zone_id = var.cloudflare_zone_id
  name    = "blog"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "blog-asia" {
  zone_id = var.cloudflare_zone_id
  name    = "blog"
  value   = var.asia
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jellyfin" {
  zone_id = var.cloudflare_zone_id
  name    = "jellyfin"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "audioserve" {
  zone_id = var.cloudflare_zone_id
  name    = "audioserve"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "llpsi-syria" {
  zone_id = var.cloudflare_zone_id
  name    = "llpsi"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "llpsi-asia" {
  zone_id = var.cloudflare_zone_id
  name    = "llpsi"
  value   = var.asia
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "resume" {
  zone_id = var.cloudflare_zone_id
  name    = "resume"
  value   = "nahsi.github.io"
  type    = "CNAME"
}

resource "cloudflare_record" "files-syria" {
  zone_id = var.cloudflare_zone_id
  name    = "files"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "files-asia" {
  zone_id = var.cloudflare_zone_id
  name    = "files"
  value   = var.asia
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "vault" {
  zone_id = var.cloudflare_zone_id
  name    = "vault"
  value   = var.asia
  type    = "A"
  ttl     = 1
}
