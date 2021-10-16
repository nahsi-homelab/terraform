provider "vault" {
  address = "http://vault.service.consul:8200"
}

resource "vault_mount" "secret" {
  path = "secret"
  type = "kv-v2"
}

resource "vault_token_auth_backend_role" "nomad-cluster" {
  role_name = "nomad-cluster"
  disallowed_policies = [
    "admin",
    "vault-agent",
    "nomad-server"
  ]
  renewable              = true
  token_period           = "259200" # 3d
  orphan                 = true
  token_explicit_max_ttl = 0
}
