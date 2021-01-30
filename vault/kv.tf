resource "vault_mount" "secret" {
  path = "secret"
  type = "kv-v2"
}

resource "vault_mount" "secret_v1" {
  path = "secret-v1"
  type = "kv"
  options = {
    version = 1
  }
}
