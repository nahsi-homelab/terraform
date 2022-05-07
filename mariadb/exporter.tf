resource "mysql_user" "exporter" {
  user = "exporter"
  host = "%"
}

resource "mysql_grant" "exporter" {
  user     = mysql_user.exporter.user
  host     = mysql_user.exporter.host
  database = "*"
  privileges = [
    "SLAVE MONITOR",
    "BINLOG MONITOR",
    "PROCESS",
    "SELECT",
  ]
}

resource "vault_database_secret_backend_static_role" "exporter" {
  backend  = vault_mount.database.path
  name     = "exporter"
  db_name  = vault_database_secret_backend_connection.mariadb.name
  username = "exporter"
  rotation_statements = [
    "SET PASSWORD FOR '{{name}}'@'${mysql_user.exporter.host}' = PASSWORD('{{password}}');"
  ]
  rotation_period = 86400 # 7d
}
