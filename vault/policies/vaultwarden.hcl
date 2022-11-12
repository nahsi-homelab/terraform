path "postgres/creds/vaultwarden"
{
  capabilities = ["read"]
}

path "secret/data/vaultwarden/*"
{
  capabilities = ["read"]
}
