resource "cloudflare_record" "minio-syria" {
  zone_id = var.cloudflare_zone_id
  name    = "minio"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "minio-asia" {
  zone_id = var.cloudflare_zone_id
  name    = "minio"
  value   = var.asia
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "s3-syria" {
  zone_id = var.cloudflare_zone_id
  name    = "s3"
  value   = var.syria
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "s3-asia" {
  zone_id = var.cloudflare_zone_id
  name    = "s3"
  value   = var.asia
  type    = "A"
  ttl     = 1
}
