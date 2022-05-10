resource "consul_config_entry" "victoria-metrics" {
  name = "victoria-metrics"
  kind = "service-intentions"

  config_json = jsonencode({
    Sources = [
      {
        Action     = "allow"
        Name       = "traefik"
        Precedence = 9
        Type       = "consul"
      },
    ]
  })
}
