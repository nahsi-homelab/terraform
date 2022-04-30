data "nomad_plugin" "seaweedfs" {
  plugin_id        = "seaweedfs"
  wait_for_healthy = true
}

resource "nomad_external_volume" "polaris" {
  type      = "csi"
  plugin_id = data.nomad_plugin.seaweedfs.id
  volume_id = "polaris"
  name      = "polaris"
  namespace = "services"

  capacity_min = "10Mib"
  capacity_max = "100Mib"

  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  parameters = {
    replication = "010"
    disk_type   = "ssd"
    "map.uid"   = "100:0"
    "map.gid"   = "100:0"
  }

  mount_options {
    mount_flags = [
      "rw",
    ]
  }
}

resource "nomad_external_volume" "mariadb" {
  type      = "csi"
  plugin_id = data.nomad_plugin.seaweedfs.id
  volume_id = "mariadb"
  name      = "mariadb"
  namespace = "infra"

  capacity_min = "10Gib"
  capacity_max = "20Gib"

  capability {
    access_mode     = "single-node-writer"
    attachment_mode = "file-system"
  }

  parameters = {
    disk_type = "ssd"
  }

  mount_options {
    mount_flags = [
      "rw",
    ]
  }
}

resource "nomad_external_volume" "music" {
  type      = "csi"
  plugin_id = data.nomad_plugin.seaweedfs.id
  volume_id = "music"
  name      = "music"
  namespace = "services"

  capacity_min = "200Gib"
  capacity_max = "200Gib"

  capability {
    access_mode     = "multi-node-multi-writer"
    attachment_mode = "file-system"
  }

  parameters = {
    disk_type = "hdd"
  }

  mount_options {
    mount_flags = [
      "rw",
    ]
  }
}
