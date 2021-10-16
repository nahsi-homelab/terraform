resource "vault_mount" "database" {
  path = "database"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend = vault_mount.database.path
  name    = "postgres"
  allowed_roles = [
    "dendrite",
    "postgres-exporter"
  ]

  postgresql {
    connection_url = "postgres://{{username}}:{{password}}@postgres.service.consul:5432/postgres?sslmode=disable"
  }

  data = {
    username = "vault"
    password = "vault"
  }
}