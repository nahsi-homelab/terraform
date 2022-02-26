# postgres-exporter
resource "vault_database_secret_backend_role" "postgres-exporter" {
  backend = vault_mount.database.path
  name    = "postgres-exporter"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 86400  # 1d
  max_ttl     = 604800 # 7d

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT pg_monitor TO \"{{name}}\";",
  ]

  revocation_statements = [
    "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.usename = '{{name}}';",
    "DROP ROLE IF EXISTS \"{{name}}\";",
  ]
}

# roundcube
resource "postgresql_database" "roundcube" {
  name  = "roundcube"
  owner = "roundcube"
}

resource "postgresql_role" "roundcube" {
  name  = "roundcube"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
  depends_on = [postgresql_database.roundcube]
}

resource "vault_database_secret_backend_static_role" "roundcube" {
  backend  = vault_mount.database.path
  name     = "roundcube"
  db_name  = vault_database_secret_backend_connection.postgres.name
  username = "roundcube"
  rotation_statements = [
    "ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"
  ]
  rotation_period = "86400"
}

# home-assistant
resource "postgresql_role" "home-assistant" {
  name  = "home-assistant"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
}

resource "postgresql_database" "home-assistant" {
  name  = "home-assistant"
  owner = "home-assistant"
}

resource "vault_database_secret_backend_static_role" "home-assistant" {
  backend  = vault_mount.database.path
  name     = "home-assistant"
  db_name  = vault_database_secret_backend_connection.postgres.name
  username = "home-assistant"
  rotation_statements = [
    "ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"
  ]
  rotation_period = "86400"
}
