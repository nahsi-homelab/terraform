path "mongo/creds/wildduck"
{
  capabilities = ["read"]
}

path "secret/data/redis/mail/users/wildduck"
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
