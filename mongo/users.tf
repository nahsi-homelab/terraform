resource "vault_database_secret_backend_role" "exporter" {
  backend = vault_mount.database.path
  name    = "exporter"
  db_name = vault_database_secret_backend_connection.mongo.name
  creation_statements = [
    jsonencode({
      db = "admin"
      roles = [
        {
          db   = "admin"
          role = "clusterMonitor"
        },
        {
          role = "read"
          db   = "local"
        }
      ]
    })
  ]
  default_ttl = "259200"  # 3d
  max_ttl     = "1036800" # 12d
}

resource "vault_database_secret_backend_role" "wildduck" {
  backend = vault_mount.database.path
  name    = "wildduck"
  db_name = vault_database_secret_backend_connection.mongo.name
  creation_statements = [
    jsonencode({
      db = "wildduck"
      roles = [
        {
          db   = "wildduck"
          role = "readwrite"
        },
      ]
    })
  ]
  default_ttl = "259200"  # 3d
  max_ttl     = "1036800" # 12d
}
