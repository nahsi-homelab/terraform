path "mongo/creds/wildduck"
{
  capabilities = ["read"]
}

path "secret/data/redis/mail/users/zone-mta"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}
