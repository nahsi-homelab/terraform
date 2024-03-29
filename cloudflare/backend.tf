terraform {
  backend "consul" {
    address = "consul.service.consul:443"
    scheme  = "https"
    path    = "terraform/cloudflare"
  }

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

provider "cloudflare" {}
