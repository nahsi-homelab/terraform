path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/certificate"
{
  capabilities = ["read"]
}

path "secret/data/traefik/pilot/traefik"
{
  capabilities = ["read"]
}
