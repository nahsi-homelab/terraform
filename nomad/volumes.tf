data "nomad_plugin" "seaweedfs" {
  plugin_id        = "seaweedfs"
  wait_for_healthy = true
}
