path "secret/data/snipeit/*"
{
  capabilities = ["read"]
}

path "mariadb/static-creds/snipeit"
{
  capabilities = ["read"]
}

path "secret/data/keydb/users/default"
{
  capabilities = ["read"]
}
