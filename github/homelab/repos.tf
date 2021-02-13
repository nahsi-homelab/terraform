resource "github_repository" "terraform" {
  name = "terraform"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "nomad" {
  name = "nomad"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "ansible" {
  name        = "ansible"
  description = "Homelabbing with Ansible"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  topics = [
    "homelab",
    "ansible",
    "gentoo",
  ]

  delete_branch_on_merge = true
}
