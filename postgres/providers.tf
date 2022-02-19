provider "vault" {
  address = "https://vault.service.consul"
}

provider "postgresql" {
  host            = "master.postgres.service.consul"
  port            = 5432
  database        = "postgres"
  username        = var.postgres_username
  password        = var.postgres_password
  superuser       = false
  sslmode         = "disable"
  connect_timeout = 15
}
