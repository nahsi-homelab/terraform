provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "acme" {
  algorithm = "RSA"
}

resource "acme_registration" "nahsi_dev" {
  account_key_pem = tls_private_key.acme.private_key_pem
  email_address   = "letsencrypt_me@nahsi.dev"
}

resource "acme_certificate" "wildcard" {
  account_key_pem           = acme_registration.nahsi_dev.account_key_pem
  common_name               = "nahsi.dev"
  subject_alternative_names = ["*.nahsi.dev"]

  dns_challenge {
    provider = "cloudflare"
  }
}

resource "vault_generic_secret" "wildcard" {
  path = "secret/certificate"
  data_json = jsonencode({
    private_key = acme_certificate.wildcard.private_key_pem
    certificate = acme_certificate.wildcard.certificate_pem
    ca_bundle   = "${acme_certificate.wildcard.certificate_pem}${acme_certificate.wildcard.issuer_pem}"
    ttl         = "3h"
  })
}
