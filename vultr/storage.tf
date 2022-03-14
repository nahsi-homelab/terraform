data "nomad_plugin" "vultr" {
  plugin_id        = "vultr-ams"
  wait_for_healthy = true
}

resource "vultr_block_storage" "postgres" {
  size_gb = 10
  label   = "postgres"
  live    = true
  region  = "ams"
}

resource "nomad_volume" "postgres" {
  depends_on  = [data.nomad_plugin.vultr]
  type        = "csi"
  namespace   = "infra"
  plugin_id   = "vultr-ams"
  volume_id   = "postgres"
  name        = "postgres"
  external_id = vultr_block_storage.postgres.id

  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  mount_options {
    fs_type     = "ext4"
    mount_flags = ["noatime"]
  }
}
