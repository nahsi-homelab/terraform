locals {
  ports = toset([
    80,
    443,
  ])
}

resource "vultr_private_network" "private" {
  description    = "pontus private"
  region         = "ams"
  v4_subnet      = "10.3.10.0"
  v4_subnet_mask = "24"
}

resource "vultr_private_network" "public" {
  description    = "pontus public"
  region         = "ams"
  v4_subnet      = "10.3.100.0"
  v4_subnet_mask = "24"
}

resource "vultr_load_balancer" "ingress" {
  region              = "ams"
  label               = "pontus ingress"
  balancing_algorithm = "roundrobin"
  proxy_protocol      = true
  attached_instances = [
    for instance in vultr_instance.pontus : instance.id
  ]
  private_network = vultr_private_network.private.id

  dynamic "forwarding_rules" {
    for_each = local.ports

    content {
      frontend_protocol = "tcp"
      frontend_port     = forwarding_rules.value
      backend_protocol  = "tcp"
      backend_port      = forwarding_rules.value
    }
  }

  dynamic "firewall_rules" {
    for_each = local.ports

    content {
      port    = firewall_rules.value
      ip_type = "v4"
      source  = "0.0.0.0/0"
    }
  }
}

resource "cloudflare_record" "ingress" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "pontus"
  value   = vultr_load_balancer.ingress.ipv4
  type    = "A"
  ttl     = 1
}
