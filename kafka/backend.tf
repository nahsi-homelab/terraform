terraform {
  backend "consul" {
    address = "consul.service.consul:8500"
    scheme  = "http"
    path    = "terraform/kafka"
  }
  required_providers {
    kafka = {
      source = "Mongey/kafka"
    }
  }
}
