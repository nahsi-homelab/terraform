resource "mysql_database" "filerun" {
  name                  = "filerun"
  default_character_set = "utf8mb3"
  default_collation     = "utf8mb3_general_ci"
}

resource "vault_database_secret_backend_role" "rilerun" {
  backend = vault_mount.database.path
  name    = "filerun"
  db_name = vault_database_secret_backend_connection.mariadb.name

  default_ttl = 604800  # 7d
  max_ttl     = 2678400 # 31d

  creation_statements = [
    "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
    "GRANT ALL PRIVILEGES ON filerun.* TO '{{name}}'@'%';",
    "FLUSH PRIVILEGES;",
  ]

  revocation_statements = [
    "DROP USER IF EXISTS '{{name}}';",
  ]
}
