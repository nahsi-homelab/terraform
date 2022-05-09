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

resource "consul_config_entry" "loki-compactor" {
  name = "loki-compactor"
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

resource "consul_config_entry" "loki-query-scheduler" {
  name = "loki-query-scheduler"
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

resource "consul_config_entry" "loki-ingester" {
  name = "loki-ingester"
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
