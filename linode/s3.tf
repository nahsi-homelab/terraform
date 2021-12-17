data "linode_object_storage_cluster" "primary" {
  id = "eu-central-1"
}

resource "linode_object_storage_bucket" "boxes" {
  cluster = data.linode_object_storage_cluster.primary.id
  label   = "boxes"
  acl     = "private"
}

resource "linode_object_storage_key" "root" {
  label = "root"
}

resource "vault_generic_secret" "root" {
  path = "secret/linode/s3/root"

  data_json = jsonencode({
    access_key = linode_object_storage_key.root.access_key
    secret_key = linode_object_storage_key.root.secret_key
  })
}

resource "linode_object_storage_key" "boxes-ro" {
  label = "boxes-ro"
  bucket_access {
    bucket_name = linode_object_storage_bucket.boxes.label
    cluster     = data.linode_object_storage_cluster.primary.id
    permissions = "read_only"
  }
}

resource "vault_generic_secret" "boxes" {
  path = "secret/linode/s3/boxes/ro"

  data_json = jsonencode({
    access_key = linode_object_storage_key.boxes-ro.access_key
    secret_key = linode_object_storage_key.boxes-ro.secret_key
  })
}
