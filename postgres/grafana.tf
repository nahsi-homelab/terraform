resource "postgresql_role" "grafana" {
  name    = "grafana"
  inherit = true
}

resource "postgresql_database" "grafana" {
  name  = "grafana"
  owner = postgresql_role.grafana.name
}

resource "postgresql_default_privileges" "grafana" {
  role     = postgresql_role.grafana.name
  database = postgresql_database.grafana.name
  schema   = "public"

  owner       = "grafana"
  object_type = "table"
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
  ]
}

resource "vault_database_secret_backend_role" "grafana" {
  backend = vault_mount.database.path
  name    = "grafana"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 86400  # 1d
  max_ttl     = 604800 # 7d

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT grafana TO \"{{name}}\";",
    "ALTER ROLE \"{{name}}\" SET ROLE grafana;",
  ]

  revocation_statements = [
    "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.usename = '{{name}}';",
    "DROP ROLE IF EXISTS \"{{name}}\";"
  ]
}
