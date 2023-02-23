output "database_path" {
  value = vault_mount.database.path
}

output "backend_connection" {
  value = vault_database_secret_backend_connection.postgres.name
}
