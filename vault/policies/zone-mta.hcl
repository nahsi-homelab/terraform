path "mongo/creds/zone-mta"
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

path "secret/data/mail/zone-mta"
{
  capabilities = ["read"]
}

path "secret/data/mail/dkim"
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
