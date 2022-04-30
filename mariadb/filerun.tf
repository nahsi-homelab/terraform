resource "mysql_database" "filerun" {
  name                  = "filerun"
  default_character_set = "utf8"
  default_collation     = "utf8_general_ci"
}

resource "mysql_user" "filerun" {
  user = "filerun"
  host = "%"
}

resource "mysql_grant" "filerun" {
  user       = mysql_user.filerun.user
  host       = mysql_user.filerun.host
  database   = mysql_database.filerun.name
  privileges = ["ALL PRIVILEGES"]
}

resource "vault_database_secret_backend_static_role" "filerun" {
  backend  = vault_mount.database.path
  name     = "filerun"
  db_name  = vault_database_secret_backend_connection.mariadb.name
  username = "filerun"
  rotation_statements = [
    "SET PASSWORD FOR '{{name}}'@'${mysql_user.filerun.host}' = PASSWORD('{{password}}');"
  ]
  rotation_period = 604800 # 7d
}
