resource "postgresql_role" "vaultwarden" {
  name    = "vaultwarden"
  inherit = true
}

resource "postgresql_database" "vaultwarden" {
  name  = "vaultwarden"
  owner = postgresql_role.vaultwarden.name
}

resource "postgresql_default_privileges" "vaultwarden" {
  role     = postgresql_role.vaultwarden.name
  database = postgresql_database.vaultwarden.name
  schema   = "public"

  owner       = "vaultwarden"
  object_type = "table"
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
  ]
}

resource "vault_database_secret_backend_role" "vaultwarden" {
  backend = vault_mount.database.path
  name    = "vaultwarden"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 604800  # 7d
  max_ttl     = 2678400 # 31d

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT vaultwarden TO \"{{name}}\";",
    "ALTER ROLE \"{{name}}\" SET ROLE vaultwarden;",
  ]

  revocation_statements = [
    "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.usename = '{{name}}';",
    "DROP ROLE IF EXISTS \"{{name}}\";"
  ]
}
