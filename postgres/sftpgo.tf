resource "postgresql_role" "sftpgo" {
  name    = "sftpgo"
  inherit = true
}

resource "postgresql_database" "sftpgo" {
  name  = "sftpgo"
  owner = postgresql_role.sftpgo.name
}

resource "postgresql_default_privileges" "sftpgo" {
  role     = postgresql_role.sftpgo.name
  database = postgresql_database.sftpgo.name
  schema   = "public"

  owner       = "sftpgo"
  object_type = "table"
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
  ]
}

resource "vault_database_secret_backend_role" "sftpgo" {
  backend = vault_mount.database.path
  name    = "sftpgo"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 604800  # 7d
  max_ttl     = 2592000 # 30d

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT sftpgo TO \"{{name}}\";",
    "ALTER ROLE \"{{name}}\" SET ROLE sftpgo;",
  ]

  revocation_statements = [
    "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.usename = '{{name}}';",
    "DROP ROLE IF EXISTS \"{{name}}\";"
  ]
}
