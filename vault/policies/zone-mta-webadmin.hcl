path "mongo/creds/zone-mta-webadmin"
{
  capabilities = ["read"]
}

path "secret/data/redis/mail/users/zone-mta"
{
  capabilities = ["read"]
}

path "secret/data/mail/zone-mta"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}
