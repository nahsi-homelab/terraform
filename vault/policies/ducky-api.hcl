path "mongo/creds/ducky-api"
{
  capabilities = ["read"]
}

path "secret/data/keydb/users/default"
{
  capabilities = ["read"]
}

path "secret/data/mail/ducky-api"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}
