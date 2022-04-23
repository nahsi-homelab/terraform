resource "postgresql_role" "seaweedfs" {
  name    = "seaweedfs"
  inherit = true
}

resource "postgresql_database" "seaweedfs" {
  name  = "seaweedfs"
  owner = postgresql_role.seaweedfs.name
}

resource "postgresql_default_privileges" "seaweedfs" {
  role     = postgresql_role.seaweedfs.name
  database = postgresql_database.seaweedfs.name
  schema   = "public"

  owner       = "seaweedfs"
  object_type = "table"
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
  ]
}

resource "vault_database_secret_backend_role" "seaweedfs" {
  backend = vault_mount.database.path
  name    = "seaweedfs"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 604800  # 7d
  max_ttl     = 2592000 # 30d

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT seaweedfs TO \"{{name}}\";",
    "ALTER ROLE \"{{name}}\" SET ROLE seaweedfs;",
  ]

  revocation_statements = [
    "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.usename = '{{name}}';",
    "DROP ROLE IF EXISTS \"{{name}}\";"
  ]
}
