path "mongo/creds/wildduck"
{
  capabilities = ["read"]
}

path "secret/data/keydb/users/default"
{
  capabilities = ["read"]
}

path "secret/data/mail/srs"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/certificate"
{
  capabilities = ["read"]
}
