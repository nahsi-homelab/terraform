resource "grafana_api_key" "nahsi" {
  name = "nahsi"
  role = "Admin"
}

resource "vault_generic_secret" "nahsi-api" {
  path = "secret/grafana/users/nahsi"

  data_json = jsonencode({
    api-key = grafana_api_key.nahsi.key
  })
}
