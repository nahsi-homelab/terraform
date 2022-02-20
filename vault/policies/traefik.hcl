path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/traefik/pilot/traefik"
{
  capabilities = ["read"]
}
