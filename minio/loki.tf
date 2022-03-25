resource "minio_s3_bucket" "loki" {
  bucket = "loki"
  acl    = "private"
}

resource "minio_iam_user" "loki" {
  name = "loki"
}

resource "minio_iam_policy" "loki" {
  name   = "loki"
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
          "arn:aws:s3:::loki"
        ]
      },
      {
        "Action": [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::loki/*"
        ]
      }
    ]
  }
  JSON
}

resource "minio_iam_user_policy_attachment" "loki" {
  user_name   = minio_iam_user.loki.name
  policy_name = minio_iam_policy.loki.name
}

resource "vault_generic_secret" "loki" {
  path = "secret/minio/loki"

  data_json = jsonencode({
    access_key = minio_iam_user.loki.name
    secret_key = minio_iam_user.loki.secret
  })
}

output "loki-password" {
  value     = minio_iam_user.loki.secret
  sensitive = "true"
}
