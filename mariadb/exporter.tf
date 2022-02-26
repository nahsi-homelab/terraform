resource "vault_database_secret_backend_role" "exporter" {
  backend = vault_mount.database.path
  name    = "exporter"
  db_name = vault_database_secret_backend_connection.mariadb.name

  default_ttl = 86400  # 1d
  max_ttl     = 604800 # 7d

  creation_statements = [
    "CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';",
    "GRANT SLAVE MONITOR, PROCESS, REPLICATION CLIENT, SELECT ON *.* TO '{{name}}'@'%';",
    "FLUSH PRIVILEGES;",
  ]

  revocation_statements = [
    "DROP USER IF EXISTS '{{name}}';",
  ]
}
