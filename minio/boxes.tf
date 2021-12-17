resource "minio_iam_user" "boxes" {
  name = "boxes"
}

resource "minio_iam_policy" "boxes" {
  name   = "boxes"
  policy = <<-JSON
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:GetBucketLocation",
          "s3:ListAllMyBuckets"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::*"
        ]
      },
      {
        "Action": [
          "s3:ListBucket"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::boxes"
        ]
      },
      {
        "Action": [
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::boxes/*"
        ]
      }
    ]
  }
  JSON
}

resource "minio_iam_user_policy_attachment" "boxes" {
  user_name   = "boxes"
  policy_name = "boxes"

  depends_on = [minio_iam_user.boxes]
}

resource "vault_generic_secret" "boxes" {
  path = "secret/minio/boxes"

  data_json = jsonencode({
    access_key = minio_iam_user.boxes.name
    secret_key = minio_iam_user.boxes.secret
  })
}

output "boxes-password" {
  value     = minio_iam_user.boxes.secret
  sensitive = "true"
}
