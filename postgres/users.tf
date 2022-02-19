# sftpgo
resource "postgresql_database" "sftpgo" {
  name  = "sftpgo"
  owner = "sftpgo"
}

resource "postgresql_role" "sftpgo" {
  name  = "sftpgo"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
  depends_on = [postgresql_database.sftpgo]
}

resource "vault_database_secret_backend_static_role" "sftpgo" {
  backend  = vault_mount.database.path
  name     = "sftpgo"
  db_name  = vault_database_secret_backend_connection.postgres.name
  username = "sftpgo"
  rotation_statements = [
    "ALTER USER \"{{name}}\" WITH PASSWORD '{{password}}';"
  ]
  rotation_period = "86400"
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
