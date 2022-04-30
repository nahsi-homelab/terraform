resource "cloudflare_record" "minio" {
  zone_id = var.cloudflare_zone_id
  name    = "minio"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "s3" {
  zone_id = var.cloudflare_zone_id
  name    = "s3"
  value   = var.syria
  type    = "A"
  ttl     = 1
}
