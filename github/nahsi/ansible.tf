resource "github_repository" "ansible-consul" {
  name        = "ansible-consul"
  description = "Ansible role for HashiCorp Consul"

  topics = [
    "consul",
    "ansible"
  ]

  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
}

resource "github_branch_protection" "ansible-consul" {
  repository_id = github_repository.ansible-consul.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = true
}
