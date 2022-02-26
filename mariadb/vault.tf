resource "vault_mount" "database" {
  path = "mariadb"
  type = "database"
}

resource "mysql_user" "vault" {
  user = "vault"
  host = "%"
}

resource "mysql_grant" "vault" {
  user     = mysql_user.vault.user
  host     = mysql_user.vault.host
  database = "*"
  grant    = true

  privileges = [
    "ALL PRIVILEGES",
  ]
}

resource "vault_database_secret_backend_connection" "mariadb" {
  backend     = vault_mount.database.path
  name        = "mariadb"
  plugin_name = "mysql-database-plugin"
  allowed_roles = [
    "shinobi",
    "exporter",
  ]

  root_rotation_statements = [
    "SET PASSWORD FOR 'vault'@'${mysql_user.vault.host}' = PASSWORD('{{password}}');",
  ]

  data = {
    username = "vault"
  }

  mysql {
    connection_url = "{{username}}:{{password}}@tcp(mariadb.service.consul:3306)/"
  }
}
