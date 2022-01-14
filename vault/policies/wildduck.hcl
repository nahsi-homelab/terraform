path "mongo/creds/wildduck"
{
  capabilities = ["read"]
}

path "secret/data/redis/mail/users/wildduck"
{
  capabilities = ["read"]
}

path "secret/data/mail"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}
