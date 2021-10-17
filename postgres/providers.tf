provider "vault" {
  address = "http://vault.service.consul:8200"
}

data "vault_generic_secret" "postgres" {
  path = "secret/postgres/superuser"
}

provider "postgresql" {
  host            = "master.postgres.service.consul"
  port            = 5432
  database        = "postgres"
  username        = data.vault_generic_secret.postgres.data["username"]
  password        = data.vault_generic_secret.postgres.data["password"]
  superuser       = true
  sslmode         = "disable"
  connect_timeout = 15
}
