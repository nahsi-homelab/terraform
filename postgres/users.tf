# dendrite
resource "postgresql_role" "dendrite" {
  name = "dendrite"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
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

# firefly
resource "postgresql_role" "firefly" {
  name = "firefly"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
}

resource "postgresql_database" "firefly" {
  name  = "firefly"
  owner = "firefly"
}

resource "vault_database_secret_backend_static_role" "firefly" {
  backend  = vault_mount.database.path
  name     = "firefly"
  db_name  = vault_database_secret_backend_connection.postgres.name
  username = "firefly"
  rotation_statements = [
    "ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"
  ]
  rotation_period = "86400"
}
