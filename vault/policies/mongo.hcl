path "secret/data/mongo/root"
{
  capabilities = ["read"]
}

path "secret/data/mongo/keyfile"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}
