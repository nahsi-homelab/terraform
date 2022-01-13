resource "nomad_scheduler_config" "config" {
  memory_oversubscription_enabled = true
  preemption_config = {
    "batch_scheduler_enabled"    = false
    "service_scheduler_enabled"  = false
    "sysbatch_scheduler_enabled" = false
    "system_scheduler_enabled"   = false
  }
}