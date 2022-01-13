resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("policies/admin.hcl")
}

resource "vault_policy" "github-runner" {
  name   = "github-runner"
  policy = file("policies/github-runner.hcl")
}

resource "vault_policy" "website" {
  name   = "website"
  policy = file("policies/website.hcl")
}

resource "vault_policy" "redis-mail" {
  name   = "redis-mail"
  policy = file("policies/redis-mail.hcl")
}

resource "vault_policy" "audioserve" {
  name   = "audioserve"
  policy = file("policies/audioserve.hcl")
}

resource "vault_policy" "prometheus" {
  name   = "prometheus"
  policy = file("policies/prometheus.hcl")
}

resource "vault_policy" "grafana" {
  name   = "grafana"
  policy = file("policies/grafana.hcl")
}

resource "vault_policy" "minio" {
  name   = "minio"
  policy = file("policies/minio.hcl")
}

resource "vault_policy" "zookeeper" {
  name   = "zookeeper"
  policy = file("policies/zookeeper.hcl")
}

resource "vault_policy" "kafka" {
  name   = "kafka"
  policy = file("policies/kafka.hcl")
}

resource "vault_policy" "wildduck" {
  name   = "wildduck"
  policy = file("policies/wildduck.hcl")
}

resource "vault_policy" "wildduck-webmail" {
  name   = "wildduck-webmail"
  policy = file("policies/wildduck-webmail.hcl")
}

resource "vault_policy" "haraka" {
  name   = "haraka"
  policy = file("policies/haraka.hcl")
}

resource "vault_policy" "zone-mta" {
  name   = "zone-mta"
  policy = file("policies/zone-mta.hcl")
}

resource "vault_policy" "mongo" {
  name   = "mongo"
  policy = file("policies/mongo.hcl")
}

resource "vault_policy" "mongo-exporter" {
  name   = "mongo-exporter"
  policy = file("policies/mongo-exporter.hcl")
}

resource "vault_policy" "kminion" {
  name   = "kminion"
  policy = file("policies/kminion.hcl")
}

resource "vault_policy" "postgres" {
  name   = "postgres"
  policy = file("policies/postgres.hcl")
}

resource "vault_policy" "dendrite" {
  name   = "dendrite"
  policy = file("policies/dendrite.hcl")
}

resource "vault_policy" "sftpg" {
  name   = "sftpgo"
  policy = file("policies/sftpgo.hcl")
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
