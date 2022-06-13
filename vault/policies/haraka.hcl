path "mongo/creds/haraka"
{
  capabilities = ["read"]
}

path "secret/data/keydb/users/default"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/mail/srs"
{
  capabilities = ["read"]
}

path "secret/data/certificate"
{
  capabilities = ["read"]
}
