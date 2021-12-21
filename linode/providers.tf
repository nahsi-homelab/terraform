provider "linode" {}
provider "vault" {
  address = "http://vault.service.consul:8200"
}
provider "cloudflare" {}
