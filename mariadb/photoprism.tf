resource "mysql_database" "photoprism" {
  name                  = "photoprism"
  default_character_set = "utf8mb4"
  default_collation     = "utf8mb4_unicode_ci"
}

resource "mysql_user" "photoprism" {
  user = "photoprism"
  host = "%"
}

resource "mysql_grant" "photoprism" {
  user       = mysql_user.photoprism.user
  host       = mysql_user.photoprism.host
  database   = mysql_database.photoprism.name
  privileges = ["ALL PRIVILEGES"]
}

resource "vault_database_secret_backend_static_role" "photoprism" {
  backend  = vault_mount.database.path
  name     = "photoprism"
  db_name  = vault_database_secret_backend_connection.mariadb.name
  username = "photoprism"
  rotation_statements = [
    "SET PASSWORD FOR '{{name}}'@'${mysql_user.photoprism.host}' = PASSWORD('{{password}}');"
  ]
  rotation_period = 604800 # 7d
}
