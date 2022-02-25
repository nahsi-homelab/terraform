terraform {
  backend "consul" {
    address = "consul.service.consul"
    scheme  = "https"
    path    = "terraform/mariadb"
  }

  required_providers {
    mysql = {
      source = "winebarrel/mysql"
    }
  }
}
