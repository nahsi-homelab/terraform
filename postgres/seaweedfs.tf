resource "postgresql_role" "seaweefs" {
  name    = "seaweefs"
  inherit = true
}

resource "postgresql_database" "seaweefs" {
  name  = "seaweefs"
  owner = postgresql_role.seaweefs.name
}

resource "postgresql_default_privileges" "seaweefs" {
  role     = postgresql_role.seaweefs.name
  database = postgresql_database.seaweefs.name
  schema   = "public"

  owner       = "seaweefs"
  object_type = "table"
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
  ]
}

resource "vault_database_secret_backend_role" "seaweefs" {
  backend = vault_mount.database.path
  name    = "seaweefs"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 604800  # 7d
  max_ttl     = 2592000 # 30d

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT seaweefs TO \"{{name}}\";",
    "ALTER ROLE \"{{name}}\" SET ROLE seaweefs;",
  ]

  revocation_statements = [
    "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.usename = '{{name}}';",
    "DROP ROLE IF EXISTS \"{{name}}\";"
  ]
}
