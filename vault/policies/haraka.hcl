path "mongo/creds/haraka"
{
  capabilities = ["read"]
}

path "secret/data/redis/mail/users/wildduck"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/mail"
{
  capabilities = ["read"]
}

path "secret/data/certificate"
{
  capabilities = ["read"]
}
