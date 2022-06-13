resource "mysql_database" "snipeit" {
  name                  = "snipeit"
  default_character_set = "utf8mb4"
  default_collation     = "utf8mb4_unicode_ci"
}

resource "mysql_user" "snipeit" {
  user = "snipeit"
  host = "%"
}

resource "mysql_grant" "snipeit" {
  user       = mysql_user.snipeit.user
  host       = mysql_user.snipeit.host
  database   = mysql_database.snipeit.name
  privileges = ["ALL PRIVILEGES"]
}

resource "vault_database_secret_backend_static_role" "snipeit" {
  backend  = vault_mount.database.path
  name     = "snipeit"
  db_name  = vault_database_secret_backend_connection.mariadb.name
  username = "snipeit"
  rotation_statements = [
    "SET PASSWORD FOR '{{name}}'@'${mysql_user.snipeit.host}' = PASSWORD('{{password}}');"
  ]
  rotation_period = 604800 # 7d
}
