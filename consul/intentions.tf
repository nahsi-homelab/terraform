resource "consul_config_entry" "default-intentions" {
  name = "*"
  kind = "service-intentions"

  config_json = jsonencode({
    Sources = [
      {
        Action     = "deny"
        Name       = "*"
        Precedence = 5
        Type       = "consul"
      }
    ]
  })
}

resource "consul_config_entry" "victoria-metrics-intentions" {
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
