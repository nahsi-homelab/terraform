resource "nomad_external_volume" "calibre" {
  type      = "csi"
  plugin_id = data.nomad_plugin.seaweedfs.id
  volume_id = "calibre"
  name      = "calibre"
  namespace = "services"

  capacity_min = "100Gib"
  capacity_max = "100Gib"

  capability {
    access_mode     = "multi-node-multi-writer"
    attachment_mode = "file-system"
  }

  parameters = {
    replication = "010"
    disk_type   = "ssd"
  }

  mount_options {
    mount_flags = [
      "rw",
    ]
  }
}

resource "nomad_external_volume" "calibre-web" {
  type      = "csi"
  plugin_id = data.nomad_plugin.seaweedfs.id
  volume_id = "calibre-web"
  name      = "calibre-web"
  namespace = "services"

  capacity_min = "1Gib"
  capacity_max = "1Gib"

  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  parameters = {
    replication = "010"
    disk_type   = "ssd"
  }

  mount_options {
    mount_flags = [
      "rw",
    ]
  }
}
