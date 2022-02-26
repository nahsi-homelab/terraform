resource "minio_s3_bucket" "cctv" {
  bucket = "cctv"
  acl    = "private"
}

resource "minio_iam_user" "cctv" {
  name = "cctv"
}

resource "minio_iam_policy" "cctv" {
  name   = "cctv"
  policy = <<-JSON
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::cctv"
        ]
      },
      {
        "Action": [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::cctv/*"
        ]
      }
    ]
  }
  JSON
}

resource "minio_iam_user_policy_attachment" "cctv" {
  user_name   = minio_iam_user.cctv.name
  policy_name = minio_iam_policy.cctv.name
}

resource "vault_generic_secret" "cctv" {
  path = "secret/minio/cctv"

  data_json = jsonencode({
    access_key = minio_iam_user.cctv.name
    secret_key = minio_iam_user.cctv.secret
  })
}

output "cctv-password" {
  value     = minio_iam_user.cctv.secret
  sensitive = "true"
}
