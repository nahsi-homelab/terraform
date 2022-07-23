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
  value   = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4BQi+4LvdzGbLoLYW2jrQI8+xUZLFReUbXauSx19CSv8SVHvHnHVT0Zl09FhJKuapC469zej/gVbbpLI3kM+DMSi7+3rx5ucxVYEMIt1ha0kO4JuTDuU2j7RE7f5RIVTPNseNPeF+yGelb2i2RvcQEn7/2vBgtqq7Lnp2ggoruhftXF95A9I8cnndJcrdYYXzNTAzE29QdTXZY5ft3rPt8YsCt3nkZk6/Sd0wbvBBwCOmFE3LazPUeul3uO7BG8f54POFG6bkVZfpO6H7CIgj3a5C+CBsPfs2SPo1e75LjruGskXj8OtfjxxtjZtX3k7Fk3Dyr0Eui2MbqdppDIM8QIDAQAB"
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
  ])
  zone_id = var.cloudflare_zone_id
  name    = each.value
  value   = var.syria
  type    = "A"
  ttl     = 1
}
