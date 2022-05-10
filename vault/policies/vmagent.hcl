path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}

path "secret/data/minio/prometheus"
{
  capabilities = ["read"]
}

path "secret/data/victoria-metrics/basicauth/vmagent"
{
  capabilities = ["read"]
}

path "/sys/metrics" {
  capabilities = ["read"]
}
