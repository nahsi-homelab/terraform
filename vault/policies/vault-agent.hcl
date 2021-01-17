%{ for cert in certs ~}
# Manage certificates for ${cert.role}
path "${cert.path}/issue/${cert.role}"
{
  capabilities = ["create", "update"]
}
%{ endfor ~}
