terraform {
  backend "consul" {
    address = "consul.service.consul:8500"
    scheme  = "http"
    path    = "terraform/namecheap"
  }
  required_providers {
    namecheap = {
      source = "namecheap/namecheap"
    }
  }
}
