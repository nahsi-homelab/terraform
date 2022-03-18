terraform {
  backend "consul" {
    address = "consul.service.consul:443"
    scheme  = "https"
    path    = "terraform/backblaze"
  }

  required_version = ">= 1.0.0"
  required_providers {
    b2 = {
      source = "Backblaze/b2"
    }
  }
}

provider "b2" {}
