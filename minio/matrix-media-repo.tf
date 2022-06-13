resource "minio_s3_bucket" "matrix-media-repo" {
  bucket = "matrix-media-repo"
  acl    = "private"
}

resource "minio_iam_user" "matrix-media-repo" {
  name = "matrix-media-repo"
}

resource "minio_iam_policy" "matrix-media-repo" {
  name   = "matrix-media-repo"
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
          "arn:aws:s3:::matrix-media-repo"
        ]
      },
      {
        "Action": [
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:s3:::matrix-media-repo/*"
        ]
      }
    ]
  }
  JSON
}

resource "minio_iam_user_policy_attachment" "matrix-media-repo" {
  user_name   = minio_iam_user.matrix-media-repo.name
  policy_name = minio_iam_policy.matrix-media-repo.name
}

resource "vault_generic_secret" "matrix-media-repo" {
  path = "secret/minio/matrix-media-repo"

  data_json = jsonencode({
    access_key = minio_iam_user.matrix-media-repo.name
    secret_key = minio_iam_user.matrix-media-repo.secret
  })
}
