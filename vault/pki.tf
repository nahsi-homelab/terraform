resource "vault_mount" "pki" {
  type                      = "pki"
  path                      = "pki"
  default_lease_ttl_seconds = "2592000"   # 30d
  max_lease_ttl_seconds     = "315360000" # 10y
}

resource "vault_pki_secret_backend_root_cert" "internal" {
  backend = vault_mount.pki.path

  type                 = "internal"
  common_name          = "Vault CA"
  organization         = "nahsi-homelab"
  format               = "pem"
  ttl                  = "315360000" # 10y
  private_key_format   = "der"
  key_type             = "rsa"
  key_bits             = 4096
  exclude_cn_from_sans = true
}

resource "vault_pki_secret_backend_config_urls" "internal_config_urls" {
  backend = vault_mount.pki.path

  issuing_certificates = [
    "http://vault.service.consul:8200/v1/${vault_mount.pki.path}/ca"
  ]
  crl_distribution_points = [
    "http://vault.service.consul:8200/v1/${vault_mount.pki.path}/crl"
  ]
}

resource "vault_pki_secret_backend_role" "consul" {
  backend = vault_mount.pki.path
  name    = "consul"

  max_ttl = "7776000" # 90d

  key_usage = [
    "DigitalSignature",
    "KeyAgreement",
    "KeyEncipherment",
  ]

  allowed_domains = [
    "consul"
  ]

  allow_subdomains = true
  allow_localhost  = true
  allow_ip_sans    = true
}

resource "vault_pki_secret_backend_role" "internal" {
  backend = vault_mount.pki.path
  name    = "internal"

  max_ttl = "7776000" # 90d

  key_usage = [
    "DigitalSignature",
    "KeyAgreement",
    "KeyEncipherment",
  ]

  ext_key_usage = [
    "ClientAuth",
    "ServerAuth"
  ]

  allowed_domains = [
    "consul"
  ]

  organization = [
    "homelab"
  ]

  allow_glob_domains = true
  allow_subdomains   = true
  allow_localhost    = true
  allow_ip_sans      = true
}
