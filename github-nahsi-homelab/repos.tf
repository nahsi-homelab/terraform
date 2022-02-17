resource "github_repository" "terraform" {
  name = "terraform"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  topics = [
    "homelab",
    "hashicorp"
  ]

  delete_branch_on_merge = true
}

resource "github_repository" "nomad" {
  name = "nomad"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  topics = [
    "homelab",
    "hashicorp",
    "nomad",
    "nomad-jobs"
  ]

  delete_branch_on_merge = true

  allow_merge_commit = false
  allow_rebase_merge = false
}

resource "github_repository" "ansible" {
  name        = "ansible"
  description = "Homelabbing with Ansible"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  topics = [
    "homelab",
    "hashicorp",
    "ansible",
    "gentoo"
  ]

  delete_branch_on_merge = true

  allow_merge_commit = false
  allow_rebase_merge = false
}

resource "github_repository" "docker" {
  name        = "docker"
  description = "Dockerfile collection"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true

  allow_merge_commit = false
  allow_rebase_merge = false
}

resource "github_repository" "packer" {
  name = "packer"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true

  allow_merge_commit = false
  allow_rebase_merge = false
}

resource "github_repository" "observability" {
  name = "observability"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  topics = [
    "homelab",
    "hashicorp",
    "grafana",
    "prometheus",
    "victoria-metrics",
    "observability",
    "monitoring",
  ]

  delete_branch_on_merge = true

  allow_merge_commit = false
  allow_rebase_merge = false
}

resource "github_branch_protection" "observability" {
  repository_id = github_repository.observability.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}
