resource "vault_mount" "database" {
  path = "mongo"
  type = "database"
}

resource "vault_database_secret_backend_connection" "mongo" {
  backend = vault_mount.database.path
  name    = "mongo"

  allowed_roles = [
    "exporter"
  ]

  mongodb {
    connection_url = "mongodb://{{username}}:{{password}}@mongo.service.consul:27017/admin?ssl=false"
  }

  data = {
    username = "vault"
    password = "vault"
  }
}
