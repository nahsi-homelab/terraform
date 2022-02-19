resource "vault_mount" "database" {
  path = "postgres"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend = vault_mount.database.path
  name    = "postgres"
  allowed_roles = [
    "admin",
    "nahsi",
    "grafana",
    "sftpgo",
    "roundcube",
    "home-assistant"
  ]

  postgresql {
    connection_url = "postgres://{{username}}:{{password}}@master.postgres.service.consul:5432/postgres?sslmode=disable"
    username       = "vault"
  }
}
