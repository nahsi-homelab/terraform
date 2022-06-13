resource "postgresql_role" "matrix_media_repo" {
  name    = "matrix_media_repo"
  inherit = true
}

resource "postgresql_database" "matrix_media_repo" {
  name  = "matrix_media_repo"
  owner = postgresql_role.matrix_media_repo.name
}

resource "postgresql_default_privileges" "matrix_media_repo" {
  role     = postgresql_role.matrix_media_repo.name
  database = postgresql_database.matrix_media_repo.name
  schema   = "public"

  owner       = "matrix_media_repo"
  object_type = "table"
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
  ]
}

resource "vault_database_secret_backend_role" "matrix_media_repo" {
  backend = vault_mount.database.path
  name    = "matrix_media_repo"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 604800  # 7d
  max_ttl     = 2678400 # 31d

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT matrix_media_repo TO \"{{name}}\";",
    "ALTER ROLE \"{{name}}\" SET ROLE matrix_media_repo;",
  ]

  revocation_statements = [
    "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.usename = '{{name}}';",
    "DROP ROLE IF EXISTS \"{{name}}\";"
  ]
}
