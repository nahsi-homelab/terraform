resource "mysql_database" "shinobi" {
  name = "shinobi"
}

resource "mysql_user" "shinobi" {
  user = "shinobi"
  host = "shinobi.service.consul"
}

resource "mysql_grant" "shinobi" {
  user       = mysql_user.shinobi.user
  host       = mysql_user.shinobi.host
  database   = mysql_database.shinobi.name
  privileges = ["ALL"]
}

resource "vault_database_secret_backend_static_role" "shinobi" {
  backend  = vault_mount.database.path
  name     = "shinobi"
  db_name  = vault_database_secret_backend_connection.mariadb.name
  username = "shinobi"
  rotation_statements = [
    "SET PASSWORD FOR '{{name}}'@'${mysql_user.shinobi.host}' = PASSWORD('{{password}}');"
  ]
  rotation_period = "86400"
}
