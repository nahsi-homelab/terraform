data "linode_object_storage_cluster" "primary" {
  id = "eu-central-1"
}

resource "linode_object_storage_key" "boxes" {
  label = "packer-boxes"
  bucket_access {
    bucket_name = linode_object_storage_bucket.boxes.label
    cluster     = data.linode_object_storage_cluster.primary.id
    permissions = "read_write"
  }
}

resource "vault_generic_secret" "boxes" {
  path = "secret/linode/boxes"

  data_json = jsonencode({
    access_key = linode_object_storage_key.boxes.access_key
    secret_key = linode_object_storage_key.boxes.secret_key
  })
}

resource "linode_object_storage_bucket" "boxes" {
  cluster = data.linode_object_storage_cluster.primary.id
  label   = "boxes"
  acl     = "public-read"
}
