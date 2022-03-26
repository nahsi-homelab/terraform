resource "consul_config_entry" "loki-querier" {
  name = "loki-querier"
  kind = "service-intentions"

  config_json = jsonencode({
    Sources = [
      {
        Action     = "allow"
        Name       = "loki-query-frontend"
        Precedence = 9
        Type       = "consul"
      },
    ]
  })
}

resource "consul_config_entry" "loki-distributor" {
  name = "loki-distributor"
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

resource "consul_config_entry" "loki-query-frontend" {
  name = "loki-query-frontend"
  kind = "service-intentions"

  config_json = jsonencode({
    Sources = [
      {
        Action     = "allow"
        Name       = "grafana-connect"
        Precedence = 9
        Type       = "consul"
      },
    ]
  })
}
