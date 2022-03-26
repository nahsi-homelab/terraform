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
