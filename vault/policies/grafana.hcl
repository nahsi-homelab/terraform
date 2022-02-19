path "secret/data/grafana/*"
{
  capabilities = ["read"]
}

path "postgres/creds/grafana"
{
  capabilities = ["read"]
}
