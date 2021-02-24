resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("policies/admin.hcl")
}

resource "vault_policy" "nomad-server" {
  name   = "nomad-server"
  policy = file("policies/nomad-server.hcl")
}

resource "vault_policy" "internal-certs" {
  name   = "internal-certs"
  policy = file("policies/internal-certs.hcl")
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
