provider "vault" {
  address = "http://vault.service.consul:8200"
}

data "vault_generic_secret" "kafka" {
  path = "secret/kafka/admin"
}

provider "kafka" {
  bootstrap_servers = [
    "kafka-1.service.consul:9092",
    "kafka-2.service.consul:9092",
    "kafka-3.service.consul:9092"
  ]
  tls_enabled   = false
  sasl_username = data.vault_generic_secret.kafka.data["username"]
  sasl_password = data.vault_generic_secret.kafka.data["password"]
}
