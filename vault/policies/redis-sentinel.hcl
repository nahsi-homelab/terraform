path "secret/data/redis/sentinel"
{
  capabilities = ["read"]
}

path "secret/data/redis/+/users/+"
{
  capabilities = ["read", "list"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}
