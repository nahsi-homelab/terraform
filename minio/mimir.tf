resource "minio_s3_bucket" "mimir" {
  bucket = "mimir"
  acl    = "private"
}

resource "minio_s3_bucket" "mimir_rules" {
  bucket = "mimir-rules"
  acl    = "private"
}

resource "minio_iam_user" "mimir" {
  name = "mimir"
}

resource "minio_iam_policy" "mimir" {
  name   = "mimir"
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
          "arn:aws:s3:::mimir",
          "arn:aws:s3:::mimir-rules"
        ]
      },
      {
        "Action": [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::mimir/*",
          "arn:aws:s3:::mimir-rules/*"
        ]
      }
    ]
  }
  JSON
}

resource "minio_iam_user_policy_attachment" "mimir" {
  user_name   = minio_iam_user.mimir.name
  policy_name = minio_iam_policy.mimir.name
}

resource "vault_generic_secret" "mimir" {
  path = "secret/minio/mimir"

  data_json = jsonencode({
    access_key = minio_iam_user.mimir.name
    secret_key = minio_iam_user.mimir.secret
  })
}
