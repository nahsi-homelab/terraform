resource "minio_iam_user" "bot-rw" {
  name = "bot-rw"
}

resource "minio_iam_policy" "bot-rw" {
  name   = "bot-rw"
  policy = <<-JSON
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "s3:*"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::*"
        ]
      }
    ]
  }
  JSON
}

resource "minio_iam_user_policy_attachment" "bot-rw" {
  user_name   = "bot-rw"
  policy_name = "bot-rw"

  depends_on = [minio_iam_user.bot-rw]
}

resource "vault_generic_secret" "bot-rw" {
  path = "secret/minio/bot-rw"

  data_json = jsonencode({
    access_key = minio_iam_user.bot-rw.name
    secret_key = minio_iam_user.bot-rw.secret
  })
}

output "bot-rw-password" {
  value     = minio_iam_user.bot-rw.secret
  sensitive = "true"
}
