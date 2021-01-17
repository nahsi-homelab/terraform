resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_approle_auth_backend_role" "vault_agent" {
  backend        = vault_auth_backend.approle.path
  role_name      = "vault-agent"
  token_ttl      = "3600"  # 1h
  token_max_ttl  = "18000" # 5h
  token_policies = ["vault-agent"]
}
