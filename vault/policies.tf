resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("policies/admin.hcl")
}

resource "vault_policy" "vault_agent" {
  name = "vault-agent"
  policy = templatefile(
    "policies/vault-agent.hcl",
    {
      certs = [
        {
          path = vault_mount.internal_pki.path,
          role = vault_pki_secret_backend_role.consul.name
        }
      ]
    }
  )
}
