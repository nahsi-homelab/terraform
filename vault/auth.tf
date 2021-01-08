resource "vault_github_auth_backend" "github" {
  organization = "nahsi-homelab"
}

resource "vault_github_user" "nahsi" {
  backend  = vault_github_auth_backend.github.id
  user     = "nahsi"
  policies = ["admin"]
}
