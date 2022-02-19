terraform {
  backend "consul" {
    address = "consul.service.consul"
    scheme  = "https"
    path    = "terraform/postgres"
  }

  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
    }
  }
}
