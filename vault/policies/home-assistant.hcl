path "postgres/static-creds/home-assistant"
{
  capabilities = ["read"]
}

path "secret/data/home-assistant/*"
{
  capabilities = ["read"]
}
