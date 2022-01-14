resource "vault_mount" "database" {
  path = "postgres"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend = vault_mount.database.path
  name    = "postgres"
  allowed_roles = [
    "dendrite",
    "sftpgo",
    "roundcube"
  ]

  postgresql {
    connection_url = "postgres://{{username}}:{{password}}@master.postgres.service.consul:5432/postgres?sslmode=disable"
  }

  data = {
    username = "vault"
    password = "vault"
  }
}
