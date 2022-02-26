resource "mysql_database" "shinobi" {
  name                  = "ccio"
  default_character_set = "utf8"
  default_collation     = "utf8_general_ci"
}

resource "mysql_user" "shinobi" {
  user = "shinobi"
  host = "%"
}

resource "mysql_grant" "shinobi" {
  user       = mysql_user.shinobi.user
  host       = mysql_user.shinobi.host
  database   = mysql_database.shinobi.name
  privileges = ["ALL PRIVILEGES"]
}

resource "vault_database_secret_backend_static_role" "shinobi" {
  backend  = vault_mount.database.path
  name     = "shinobi"
  db_name  = vault_database_secret_backend_connection.mariadb.name
  username = "shinobi"
  rotation_statements = [
    "SET PASSWORD FOR '{{name}}'@'${mysql_user.shinobi.host}' = PASSWORD('{{password}}');"
  ]
  rotation_period = 604800 # 7d
}
