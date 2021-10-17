path "secret/data/zookeeper/kafka"
{
  capabilities = ["read"]
}

path "secret/data/kafka/*"
{
  capabilities = ["read"]
}
