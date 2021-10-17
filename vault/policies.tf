resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("policies/admin.hcl")
}

resource "vault_policy" "grafana" {
  name   = "grafana"
  policy = file("policies/grafana.hcl")
}

resource "vault_policy" "zookeeper" {
  name   = "zookeeper"
  policy = file("policies/zookeeper.hcl")
}

resource "vault_policy" "kafka" {
  name   = "kafka"
  policy = file("policies/kafka.hcl")
}

resource "vault_policy" "kminion" {
  name   = "kminion"
  policy = file("policies/kminion.hcl")
}

resource "vault_policy" "postgres" {
  name   = "postgres"
  policy = file("policies/postgres.hcl")
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
