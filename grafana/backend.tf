terraform {
  backend "consul" {
    address = "consul.service.consul"
    scheme  = "https"
    path    = "terraform/grafana"
  }

  required_providers {
    grafana = {
      source = "grafana/grafana"
    }
  }
}

provider "grafana" {
  url = "https://grafana.service.consul"
}

provider "vault" {
  address = "https://vault.service.consul"
}
