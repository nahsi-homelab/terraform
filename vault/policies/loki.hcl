path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/minio/loki"
{
  capabilities = ["read"]
}

path "secret/data/redis/loki/users/default"
{
  capabilities = ["read"]
}
