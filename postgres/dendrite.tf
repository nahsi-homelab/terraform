resource "postgresql_role" "dendrite" {
  name    = "dendrite"
  inherit = true
}

resource "postgresql_database" "dendrite" {
  name  = "dendrite"
  owner = postgresql_role.dendrite.name
}

resource "postgresql_default_privileges" "dendrite" {
  role     = postgresql_role.dendrite.name
  database = postgresql_database.dendrite.name
  schema   = "public"

  owner       = "dendrite"
  object_type = "table"
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
  ]
}

resource "vault_database_secret_backend_role" "dendrite" {
  backend = vault_mount.database.path
  name    = "dendrite"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 604800  # 7d
  max_ttl     = 2678400 # 31d

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT dendrite TO \"{{name}}\";",
    "ALTER ROLE \"{{name}}\" SET ROLE dendrite;",
  ]

  revocation_statements = [
    "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.usename = '{{name}}';",
    "DROP ROLE IF EXISTS \"{{name}}\";"
  ]
}
