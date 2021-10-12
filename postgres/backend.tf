terraform {
  backend "consul" {
    address = "consul.service.consul:8500"
    scheme  = "http"
    path    = "terraform/postgres"
  }

  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
    }
  }
}
