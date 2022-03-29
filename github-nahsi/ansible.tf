resource "github_repository" "ansible-consul" {
  name        = "ansible-consul"
  description = "Ansible role for HashiCorp Consul"

  topics = [
    "consul",
    "hashicorp",
    "ansible"
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
    "ansible"
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
    "ansible"
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
    "ansible"
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
