provider "vault" {
  address = "https://vault.service.consul"
}

resource "vault_pki_secret_backend_cert" "vault" {
  backend = "pki"
  name    = "internal"

  common_name = "vault.service.consul"
  ttl         = 2678400 # 31d
  auto_renew  = true
}

provider "mysql" {
  endpoint = "mariadb.service.consul:3006"
  username = var.mariadb_username
  password = var.mariadb_password
  tls      = true
}
