resource "vault_token_auth_backend_role" "nomad" {
  role_name              = "nomad"
  disallowed_policies    = ["nomad-server"]
  renewable              = true
  token_period           = "259200" # 3d
  orphan                 = true
  token_explicit_max_ttl = 0
}
