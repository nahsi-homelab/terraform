resource "vault_mount" "database" {
  path = "mariadb"
  type = "database"
}

resource "vault_database_secret_backend_connection" "mariadb" {
  backend     = vault_mount.database.path
  name        = "mariadb"
  plugin_name = "mysql-database-plugin"
  allowed_roles = [
    "shinobi",
  ]

  mysql {
    connection_url = "{{username}}:{{password}}@tcp(mariadb.service.consul:3306)/"
  }

  data = {
    username = "vault"
    password = "vault"
  }
}
