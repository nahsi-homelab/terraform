path "secret/data/mariadb/users/maxscale"
{
  capabilities = ["read"]
}

path "secret/data/mariadb/users/replication"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}
