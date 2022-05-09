path "secret/data/gossip"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/loki/basicauth/promtail"
{
  capabilities = ["read"]
}
