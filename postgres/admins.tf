resource "postgresql_role" "admins" {
  name            = "admins"
  create_role     = true
  create_database = true
  inherit         = true
}

resource "vault_database_secret_backend_role" "admin" {
  backend = vault_mount.database.path
  name    = "admin"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 3600  # 1h
  max_ttl     = 10800 # 3h

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT admins TO \"{{name}}\";"
  ]
}

resource "postgresql_role" "nahsi" {
  name  = "nahsi"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
}

resource "postgresql_grant_role" "nahsi" {
  role       = postgresql_role.nahsi.name
  grant_role = "pg_read_all_data"
}

resource "vault_database_secret_backend_static_role" "nahsi" {
  backend  = vault_mount.database.path
  name     = "nahsi"
  db_name  = vault_database_secret_backend_connection.postgres.name
  username = "nahsi"
  rotation_statements = [
    "ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"
  ]
  rotation_period = "86400"
}
