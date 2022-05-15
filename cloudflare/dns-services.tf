resource "cloudflare_record" "dashboard" {
  zone_id = var.cloudflare_zone_id
  name    = "nahsi.dev"
  value   = var.syria
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

resource "cloudflare_record" "llpsi" {
  zone_id = var.cloudflare_zone_id
  name    = "llpsi"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "resume" {
  zone_id = var.cloudflare_zone_id
  name    = "resume"
  value   = "nahsi.github.io"
  type    = "CNAME"
}

resource "cloudflare_record" "files" {
  zone_id = var.cloudflare_zone_id
  name    = "files"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "vault" {
  zone_id = var.cloudflare_zone_id
  name    = "vault"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "transmission-taisto" {
  zone_id = var.cloudflare_zone_id
  name    = "transmission-taisto"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "filerun" {
  zone_id = var.cloudflare_zone_id
  name    = "filerun"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "calibre" {
  zone_id = var.cloudflare_zone_id
  name    = "calibre"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "audiobookshelf" {
  zone_id = var.cloudflare_zone_id
  name    = "audio"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "polaris" {
  zone_id = var.cloudflare_zone_id
  name    = "polaris"
  value   = var.syria
  type    = "A"
  ttl     = 1
}
