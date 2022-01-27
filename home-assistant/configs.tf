resource "consul_keys" "home-assistant" {
  dynamic "key" {
    for_each = fileset("${path.module}", "configs/**.yml")
    content {
      path   = "configs/home-assistant/${trimsuffix(key.value, ".yml")}"
      value  = file("${key.value}")
      delete = true
    }
  }
}
