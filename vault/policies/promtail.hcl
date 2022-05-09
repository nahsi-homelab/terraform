path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/loki/basicauth/promtail"
{
  capabilities = ["read"]
}
