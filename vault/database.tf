resource "vault_mount" "database" {
  path = "database"
  type = "database"
}

resource "vault_database_secret_backend_connection" "postgres" {
  backend       = vault_mount.database.path
  name          = "postgres"
  allowed_roles = ["linkace"]

  postgresql {
    connection_url = "postgres://{{username}}:{{password}}@postgres.service.consul:5432/postgres?sslmode=disable"
  }

  data = {
    username = "vault"
    password = "vault"
  }
}

resource "vault_database_secret_backend_role" "linkace" {
  backend = vault_mount.database.path
  name    = "linkace"
  db_name = vault_database_secret_backend_connection.postgres.name
  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT ALL PRIVILEGES ON DATABASE \"linkace\" to \"{{name}}\";"
  ]
  revocation_statements = [
    "REVOKE ALL PRIVILEGES ON DATABASE \"linkace\" FROM \"{{name}}\";",
    "DROP ROLE \"{{name}}\";"
  ]
}
