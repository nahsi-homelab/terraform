resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "vault_agent" {
  backend   = vault_auth_backend.approle.path
  role_name = "vault-agent"

  token_policies = [
    "vault-agent",
  ]

  secret_id_bound_cidrs = [
    "10.0.100.0/24",
    "10.0.30.0/24",
    "10.1.10.0/24",
    "10.2.10.0/24",
  ]
}
