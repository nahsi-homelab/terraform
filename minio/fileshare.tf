resource "minio_s3_bucket" "fileshare" {
  bucket = "fileshare"
  acl    = "private"
}

resource "minio_iam_user" "fileshare" {
  name = "fileshare"
}

resource "minio_iam_policy" "fileshare" {
  name   = "fileshare"
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
          "arn:aws:s3:::fileshare"
        ]
      },
      {
        "Action": [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::fileshare/*"
        ]
      }
    ]
  }
  JSON
}

resource "minio_iam_user_policy_attachment" "fileshare" {
  user_name   = minio_iam_user.fileshare.name
  policy_name = minio_iam_policy.fileshare.name
}

resource "vault_generic_secret" "fileshare" {
  path = "secret/minio/fileshare"

  data_json = jsonencode({
    access_key = minio_iam_user.fileshare.name
    secret_key = minio_iam_user.fileshare.secret
  })
}
