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
