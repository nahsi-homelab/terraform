resource "vault_database_secret_backend_role" "exporter" {
  backend = vault_mount.database.path
  name    = "exporter"
  db_name = vault_database_secret_backend_connection.mongo.name
  creation_statements = [
    jsonencode({
      db = "admin"
      roles = [
        {
          db      = "admin"
          role    = "clusterMonitor"
        },
        {
          role = "read"
          db   = "local"
        }
      ],
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
      db      = "wildduck"
      roles = [
        {
          db   = "wildduck"
          role = "readWrite"
        },
        {
          db   = "wildduck-attachments"
          role = "readWrite"
        },
        {
          db   = "wildduck-users"
          role = "readWrite"
        },
        {
          db   = "zone-mta"
          role = "readWrite"
        },
      ]
    })
  ]
  default_ttl = "259200"  # 3d
  max_ttl     = "1036800" # 12d
}

resource "vault_database_secret_backend_role" "haraka" {
  backend = vault_mount.database.path
  name    = "haraka"
  db_name = vault_database_secret_backend_connection.mongo.name
  creation_statements = [
    jsonencode({
      db = "wildduck"
      roles = [
        {
          db   = "wildduck"
          role = "readWrite"
        },
        {
          db   = "wildduck-attachments"
          role = "readWrite"
        },
        {
          db   = "wildduck-users"
          role = "readWrite"
        },
      ]
    })
  ]
  default_ttl = "259200"  # 3d
  max_ttl     = "1036800" # 12d
}

resource "vault_database_secret_backend_role" "zone-mta" {
  backend = vault_mount.database.path
  name    = "zone-mta"
  db_name = vault_database_secret_backend_connection.mongo.name
  creation_statements = [
    jsonencode({
      db = "zone-mta"
      roles = [
        {
          db   = "zone-mta"
          role = "readWrite"
        },
        {
          db   = "wildduck-users"
          role = "read"
        },
        {
          db   = "wildduck-attachments"
          role = "readWrite"
        },
      ]
    })
  ]
  default_ttl = "259200"  # 3d
  max_ttl     = "1036800" # 12d
}

resource "vault_database_secret_backend_role" "zone-mta-webadmin" {
  backend = vault_mount.database.path
  name    = "zone-mta-webadmin"
  db_name = vault_database_secret_backend_connection.mongo.name
  creation_statements = [
    jsonencode({
      db = "zone-mta-logs"
      roles = [
        {
          db   = "zone-mta-logs"
          role = "readWrite"
        },
      ]
    })
  ]
  default_ttl = "259200"  # 3d
  max_ttl     = "1036800" # 12d
}

resource "vault_database_secret_backend_role" "ducky-api" {
  backend = vault_mount.database.path
  name    = "ducky-api"
  db_name = vault_database_secret_backend_connection.mongo.name
  creation_statements = [
    jsonencode({
      db = "ducky-api"
      roles = [
        {
          db   = "ducky-api"
          role = "readWrite"
        },
      ]
    })
  ]
  default_ttl = "259200"  # 3d
  max_ttl     = "1036800" # 12d
}
