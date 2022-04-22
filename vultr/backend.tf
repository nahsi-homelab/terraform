terraform {
  backend "consul" {
    address = "consul.service.consul"
    scheme  = "https"
    path    = "terraform/vultr"
  }

  required_providers {
    vultr = {
      source = "vultr/vultr"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

data "cloudflare_zones" "domain" {
  filter {
    name = "nahsi.dev"
  }
}
