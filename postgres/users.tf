# dendrite
resource "postgresql_role" "dendrite" {
  name = "dendrite"
  login = true
}

resource "postgresql_database" "dendrite" {
  name  = "dendrite"
  owner = "dendrite"
}

resource "vault_database_secret_backend_static_role" "dendrite" {
  backend  = vault_mount.database.path
  name     = "dendrite"
  db_name  = vault_database_secret_backend_connection.postgres.name
  username = "dendrite"
  rotation_statements = [
    "ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"
  ]
  rotation_period = "86400"
}
