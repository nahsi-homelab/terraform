terraform {
  backend "consul" {
    scheme = "http"
    path   = "terraform/minio"
  }

  required_providers {
    minio = {
      source  = "aminueza/minio"
      version = "1.5.0"
    }
  }
}
