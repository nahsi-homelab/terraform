resource "nomad_external_volume" "filerun" {
  type      = "csi"
  plugin_id = data.nomad_plugin.seaweedfs.id
  volume_id = "filerun"
  name      = "filerun"
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

resource "nomad_external_volume" "filerun-nahsi" {
  type      = "csi"
  plugin_id = data.nomad_plugin.seaweedfs.id
  volume_id = "filerun-nahsi"
  name      = "filerun-nahsi"
  namespace = "services"

  capacity_min = "1T"
  capacity_max = "1T"

  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  parameters = {
    replication = "010"
    disk_type   = "hdd"
  }

  mount_options {
    mount_flags = [
      "rw",
    ]
  }
}

resource "nomad_external_volume" "filerun-taisto" {
  type      = "csi"
  plugin_id = data.nomad_plugin.seaweedfs.id
  volume_id = "filerun-taisto"
  name      = "filerun-taisto"
  namespace = "services"

  capacity_min = "500GiB"
  capacity_max = "500GiB"

  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  parameters = {
    replication = "010"
    disk_type   = "hdd"
  }

  mount_options {
    mount_flags = [
      "rw",
    ]
  }
}
