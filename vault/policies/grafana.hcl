path "secret/data/grafana/*"
{
  capabilities = ["read"]
}

path "postgres/creds/grafana"
{
  capabilities = ["read"]
}

path "secret/data/loki/basicauth/grafana"
{
  capabilities = ["read"]
}

path "secret/data/prometheus/basicauth/grafana"
{
  capabilities = ["read"]
}
