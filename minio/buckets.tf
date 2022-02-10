resource "minio_s3_bucket" "boxes" {
  bucket = "boxes"
  acl    = "private"
}

resource "minio_s3_bucket" "homer" {
  bucket = "homer"
  acl    = "public"
}

resource "minio_s3_bucket" "resume" {
  bucket = "resume"
  acl    = "public"
}
