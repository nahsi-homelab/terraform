provider "vault" {
  address = "http://active.vault.service.consul:8200"
}

data "vault_generic_secret" "minio" {
  path = "secret/minio/root"
}

provider "minio" {
  minio_server     = "s3.nahsi.dev"
  minio_region     = "homelab"
  minio_ssl        = true
  minio_access_key = data.vault_generic_secret.minio.data["username"]
  minio_secret_key = data.vault_generic_secret.minio.data["password"]
}
