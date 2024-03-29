resource "github_repository" "ansible-consul" {
  name        = "ansible-consul"
  description = "Ansible role for HashiCorp Consul"

  topics = [
    "consul",
    "hashicorp",
    "ansible",
    "gentoo",
  ]

  has_issues = true

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "ansible-consul" {
  repository_id = github_repository.ansible-consul.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}

resource "github_repository" "ansible-nomad" {
  name        = "ansible-nomad"
  description = "Ansible role for HashiCorp Nomad"

  topics = [
    "nomad",
    "hashicorp",
    "ansible",
    "gentoo",
  ]

  has_issues = true

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "ansible-nomad" {
  repository_id = github_repository.ansible-nomad.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}

resource "github_repository" "ansible-vault" {
  name        = "ansible-vault"
  description = "Ansible role for HashiCorp Vault"

  topics = [
    "vault",
    "hashicorp",
    "ansible",
    "gentoo",
  ]

  has_issues = true

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "ansible-vault" {
  repository_id = github_repository.ansible-vault.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}

resource "github_repository" "ansible-vault-agent" {
  name        = "ansible-vault-agent"
  description = "Ansible role for HashiCorp Vault agent"

  topics = [
    "vault",
    "vault-agent",
    "hashicorp",
    "ansible",
    "gentoo",
  ]

  has_issues = true

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "ansible-vault-agent" {
  repository_id = github_repository.ansible-vault-agent.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}

resource "github_repository" "ansible-telegraf" {
  name        = "ansible-telegraf"
  description = "Ansible role for InfluxDB Telegraf"

  topics = [
    "telegraf",
    "metrics",
    "observability",
    "ansible",
    "gentoo",
  ]

  has_issues = true

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "ansible-telegraf" {
  repository_id = github_repository.ansible-telegraf.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}

resource "github_repository" "ansible-node-exporter" {
  name        = "ansible-node-exporter"
  description = "Ansible role for node_exporter"

  topics = [
    "prometheus",
    "node-exporter",
    "metrics",
    "observability",
    "ansible",
    "gentoo",
  ]

  has_issues = true

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "ansible-node-exporter" {
  repository_id = github_repository.ansible-node-exporter.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}

resource "github_repository" "ansible-promtail" {
  name        = "ansible-promtail"
  description = "Ansible role for promtail"

  topics = [
    "promtail",
    "loki",
    "logs",
    "observability",
    "ansible",
    "gentoo",
  ]

  has_issues = true

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "ansible-promtail" {
  repository_id = github_repository.ansible-promtail.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}

resource "github_repository" "ansible-cadvisor" {
  name        = "ansible-cadvisor"
  description = "Ansible role for cadvisor"

  topics = [
    "prometheus",
    "docker",
    "cadvisor",
    "metrics",
    "observability",
    "ansible",
    "ansible",
    "gentoo",
  ]

  has_issues = true

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "ansible-cadvisor" {
  repository_id = github_repository.ansible-cadvisor.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}
