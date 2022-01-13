path "mongo/creds/zone-mta"
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
