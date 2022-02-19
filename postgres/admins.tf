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
