resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("policies/admin.hcl")
}

resource "vault_policy" "consul_template" {
  name = "consul-template"
  policy = templatefile(
    "policies/consul-template.hcl",
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
