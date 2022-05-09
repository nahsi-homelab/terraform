terraform {
  backend "consul" {
    address = "consul.service.consul"
    scheme  = "https"
    path    = "terraform/minio"
  }

  required_providers {
    minio = {
      source = "aminueza/minio"
    }
  }
}

provider "vault" {
  address = "https://vault.service.consul"
}

data "vault_generic_secret" "minio" {
  path = "secret/minio/root"
}

provider "minio" {
  minio_server     = "s3.nahsi.dev"
  minio_region     = "syria"
  minio_ssl        = true
  minio_access_key = data.vault_generic_secret.minio.data["username"]
  minio_secret_key = data.vault_generic_secret.minio.data["password"]
}
