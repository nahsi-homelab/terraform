resource "cloudflare_record" "servers" {
  for_each = toset([
    "10.1.10.10",
    "10.1.10.20",
    "10.1.10.30",
  ])

  zone_id = var.cloudflare_zone_id
  name    = "hashi.nahsi.dev"
  value   = each.key
  type    = "A"
}

resource "cloudflare_record" "dashboard" {
  zone_id = var.cloudflare_zone_id
  name    = "nahsi.dev"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "assets" {
  zone_id = var.cloudflare_zone_id
  name    = "assets"
  value   = "f003.backblazeb2.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "resume" {
  zone_id = var.cloudflare_zone_id
  name    = "resume"
  value   = "nahsi.github.io"
  type    = "CNAME"
}

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

resource "cloudflare_record" "mx" {
  zone_id  = var.cloudflare_zone_id
  name     = "nahsi.dev"
  value    = "nahsi.dev"
  type     = "MX"
  priority = "10"
  ttl      = 3600
}

resource "cloudflare_record" "spf" {
  zone_id = var.cloudflare_zone_id
  name    = "nahsi.dev"
  value   = "v=spf1 a:nahsi.dev ip4:91.245.37.33 -all"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "dkim" {
  zone_id = var.cloudflare_zone_id
  name    = "mail._domainkey.nahsi.dev"
  value   = "v=DKIM1;t=s;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsJGHN2vrzX+B6g1OdvXRAsKimjKJvxFVegXJ0MX9g4bn8SF2L/IUjgLEpzTeDfoM6Jmq9BWjhAti0QlpYm0hDD5uQ4/TjKuL2KR5XD21IoymAnNUt0HAgWw/ot9U2nqhQAL0n9TEa5RMOGl1veMjcB7nOXPYf5pd2nDkaICrSe9n4rdr/YsyP7Q8owgFtAGKHxAxs+1QEGnGDnp806+m2gz5fSVcEYAbO3qr++AiG52boPQ+psRf5e2qQPwpUUxr0kFKKTaXmooDNqeGGXnYSSqwqPfXNnhEQdWHYABGNlx441s+dWux0QivjrHI8LhqaTqsItLtMj4rZgmreFG1ywIDAQAB"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "dmarc" {
  zone_id = var.cloudflare_zone_id
  name    = "_dmarc.nahsi.dev"
  value   = "v=DMARC1; p=quarantine; rua=mailto:dmarc@nahsi.dev;"
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_record" "matrix" {
  zone_id = var.cloudflare_zone_id
  name    = "nahsi.dev"
  type    = "SRV"

  data {
    service = "_matrix"
    proto   = "_tcp"
    name    = "@"
    port    = 443
    target  = "nahsi.dev"
  }
}

resource "cloudflare_record" "services" {
  for_each = toset([
    "mail",
    "minio",
    "s3",
    "jellyfin",
    "polaris",
    "navidrome",
    "audio",
    "calibre",
    "files",
    "llpsi",
    "transmission-taisto",
    "libreddit",
    "vaultwarden",
    "snipeit",
    "photo",
  ])
  zone_id = var.cloudflare_zone_id
  name    = each.value
  value   = var.syria
  type    = "A"
  ttl     = 1
}
