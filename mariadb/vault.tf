resource "vault_mount" "database" {
  path = "mariadb"
  type = "database"
}

resource "mysql_user" "vault" {
  user               = "vault"
  host               = "%"
  plaintext_password = "root"

  lifecycle {
    ignore_changes = [plaintext_password]
  }
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
    "filerun",
    "exporter",
  ]

  root_rotation_statements = [
    "SET PASSWORD FOR 'vault'@'${mysql_user.vault.host}' = PASSWORD('{{password}}');",
  ]

  mysql {
    connection_url       = "{{username}}:{{password}}@tcp(mariadb.service.consul:3006)/"
    max_open_connections = "10"
    username             = "vault"
    password             = "root"

    tls_certificate_key = format(
      "%s\n%s",
      vault_pki_secret_backend_cert.vault.private_key,
      vault_pki_secret_backend_cert.vault.certificate,
    )
    tls_ca = vault_pki_secret_backend_cert.vault.issuing_ca
  }
}
