resource "nomad_scheduler_config" "config" {
  memory_oversubscription_enabled = true
  scheduler_algorithm = "spread"
  preemption_config = {
    "batch_scheduler_enabled"    = false
    "service_scheduler_enabled"  = true
    "sysbatch_scheduler_enabled" = false
    "system_scheduler_enabled"   = false
  }
}
