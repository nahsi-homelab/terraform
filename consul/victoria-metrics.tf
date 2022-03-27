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
      {
        Action     = "allow"
        Name       = "vmagent"
        Precedence = 9
        Type       = "consul"
      },
      {
        Action     = "allow"
        Name       = "grafana-connect"
        Precedence = 9
        Type       = "consul"
      },
    ]
  })
}

resource "consul_config_entry" "vmagent" {
  name = "vmagent"
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
