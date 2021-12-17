terraform {
  backend "consul" {
    scheme = "http"
    path   = "terraform-state/minio"
  }

  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "1.2.0"
    }
  }
}
