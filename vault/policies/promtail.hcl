path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/promtail/loki"
{
  capabilities = ["read"]
}
