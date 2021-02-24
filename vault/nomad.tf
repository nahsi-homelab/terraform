resource "vault_token_auth_backend_role" "nomad-cluster" {
  role_name              = "nomad-cluster"
  allowed_policies       = ["internal-certs"]
  renewable              = true
  token_period           = "259200" # 3d
  orphan                 = true
  token_explicit_max_ttl = 0
}
