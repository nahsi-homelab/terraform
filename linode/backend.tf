terraform {
  backend "consul" {
    address = "consul.service.consul:8500"
    scheme  = "http"
    path    = "terraform/linode"
  }
  required_providers {
    linode = {
      source = "linode/linode"
    }

    namecheap = {
      source = "namecheap/namecheap"
    }
  }
}
