resource "nomad_namespace" "services" {
  name        = "services"
  description = "Self-hosted goodies"
}

resource "nomad_namespace" "infra" {
  name = "infra"
}

resource "nomad_namespace" "observability" {
  name = "observability"
}

resource "nomad_namespace" "github" {
  name        = "github"
  description = "GitHub runners"
}
