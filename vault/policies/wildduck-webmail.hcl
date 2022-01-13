path "mongo/creds/wildduck-webmail"
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
