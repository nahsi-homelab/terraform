# dendrite
resource "postgresql_role" "dendrite" {
  name  = "dendrite"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
}

resource "postgresql_database" "dendrite" {
  name  = "dendrite"
  owner = "dendrite"
}

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

# sftpgo
resource "postgresql_role" "sftpgo" {
  name  = "sftpgo"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
}

resource "postgresql_database" "sftpgo" {
  name  = "sftpgo"
  owner = "sftpgo"
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
resource "postgresql_role" "roundcube" {
  name  = "roundcube"
  login = true
  lifecycle {
    ignore_changes = [
      password
    ]
  }
}

resource "postgresql_database" "roundcube" {
  name  = "roundcube"
  owner = "roundcube"
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
