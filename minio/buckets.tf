resource "minio_s3_bucket" "boxes" {
  bucket = "boxes"
  acl    = "private"
}
