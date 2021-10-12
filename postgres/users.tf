# postgres-exporter
resource "vault_database_secret_backend_static_role" "postgres-exporter" {
  backend  = vault_mount.database.path
  name     = "postgres-exporter"
  db_name  = vault_database_secret_backend_connection.postgres.name
  username = "postgres_exporter"
  rotation_statements = [
    "ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"
  ]
  rotation_period = "86400"
}

resource "vault_policy" "postgres-exporter" {
  name   = "postgres-exporter"
  policy =<<-EOF
path "database/static-creds/postgres-exporter"
{
  capabilities = ["read"]
}
EOF
}

# dendrite
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

resource "vault_policy" "dendrite" {
  name   = "dendrite"
  policy =<<-EOF
path "database/static-creds/dendrite"
{
  capabilities = ["read"]
}
EOF
}
