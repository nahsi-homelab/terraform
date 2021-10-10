resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("policies/admin.hcl")
}

resource "vault_policy" "grafana" {
  name   = "grafana"
  policy = file("policies/grafana.hcl")
}

resource "vault_policy" "postgres" {
  name   = "postgres"
  policy = file("policies/postgres.hcl")
}

resource "vault_policy" "dendrite" {
  name   = "dendrite"
  policy = file("policies/dendrite.hcl")
}

resource "vault_policy" "postgres-exporter" {
  name   = "postgres-exporter"
  policy = file("policies/postgres-exporter.hcl")
}

resource "vault_policy" "unpoller" {
  name   = "unpoller"
  policy = file("policies/unpoller.hcl")
}

resource "vault_policy" "nomad-server" {
  name   = "nomad-server"
  policy = file("policies/nomad-server.hcl")
}

resource "vault_policy" "internal-certs" {
  name   = "internal-certs"
  policy = file("policies/internal-certs.hcl")
}

resource "vault_policy" "public-cert" {
  name   = "public-cert"
  policy = file("policies/public-cert.hcl")
}

resource "vault_policy" "vault-agent" {
  name = "vault-agent"
  policy = templatefile(
    "policies/vault-agent.hcl",
    {
      certs = [
        {
          path = vault_mount.pki.path
          role = vault_pki_secret_backend_role.consul.name
        }
      ]
    }
  )
}
