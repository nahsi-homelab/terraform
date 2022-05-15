path "postgres/creds/dendrite"
{
  capabilities = ["read"]
}

path "secret/data/dendrite/matrix-key"
{
  capabilities = ["read"]
}

path "secret/data/dendrite/registration-key"
{
  capabilities = ["read"]
}

path "pki/issue/internal"
{
  capabilities = ["create", "update"]
}
