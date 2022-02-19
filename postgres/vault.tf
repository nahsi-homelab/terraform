resource "vault_mount" "database" {
  path = "postgres"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend = vault_mount.database.path
  name    = "postgres"
  allowed_roles = [
    "admin",
    "sftpgo",
    "roundcube",
    "home-assistant"
  ]

  postgresql {
    connection_url = "postgres://{{username}}:{{password}}@master.postgres.service.consul:5432/postgres?sslmode=disable"
  }

  data = {
    username = "vault"
    password = "vault"
  }
}

resource "vault_database_secret_backend_role" "admin" {
  backend = vault_mount.database.path
  name    = "admin"
  db_name = vault_database_secret_backend_connection.postgres.name

  default_ttl = 3600  # 1h
  max_ttl     = 10800 # 3h

  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN CREATEDB CREATEROLE PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
  ]
}
