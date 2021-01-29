%{ for cert in certs ~}
# Manage certificates for ${cert.role}
path "${cert.path}/issue/${cert.role}"
{
  capabilities = ["create", "update"]
}
%{ endfor ~}

path "auth/token/renew" {
  capabilities = ["update"]
}

path "auth/token/renew-self" {
  capabilities = ["update"]
}

path "/auth/token/roles/nomad" {
  capabilities = ["update"]
}
