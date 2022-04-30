terraform {
  backend "consul" {
    scheme  = "https"
    address = "consul.service.consul"
    path    = "terraform/nomad"
  }
}

provider "nomad" {
  address = "https://nomad.service.consul"
}
