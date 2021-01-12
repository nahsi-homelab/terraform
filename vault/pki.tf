resource "vault_mount" "internal_pki" {
  path        = "pki/internal"
  type        = "pki"
  description = "For use inside homelab"

  default_lease_ttl_seconds = "86400"  # 24h
  max_lease_ttl_seconds     = "604800" # 7d
}

resource "vault_pki_secret_backend_root_cert" "internal_ca" {
  backend = vault_mount.internal_pki.path

  type                 = "internal"
  common_name          = "Internal CA"
  format               = "pem"
  ttl                  = "315360000" # 10y
  private_key_format   = "der"
  key_type             = "rsa"
  key_bits             = 4096
  exclude_cn_from_sans = true
  organization         = "nahsi-homelab"
}

resource "vault_pki_secret_backend_config_urls" "internal_config_urls" {
  backend = vault_mount.internal_pki.path

  issuing_certificates    = ["http://vault.service.consul:8200/v1/${vault_mount.internal_pki.path}/ca"]
  crl_distribution_points = ["http://vault.service.consul:8200/v1/${vault_mount.internal_pki.path}/crl"]
}

resource "vault_pki_secret_backend_role" "consul" {
  backend = vault_mount.internal_pki.path
  name    = "consul"

  max_ttl          = "86400"
  allow_subdomains = true
  allow_localhost  = true
  allow_ip_sans    = true

  key_usage = [
    "DigitalSignature",
    "KeyAgreement",
    "KeyEncipherment",
  ]

  allowed_domains = [
    "consul"
  ]
}
