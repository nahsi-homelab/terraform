provider "vault" {
  address = "https://vault.service.consul"
}

provider "mysql" {
  endpoint = "mariadb.service.consul"
  username = var.mariadb_username
  password = var.mariadb_password
}
