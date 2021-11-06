resource "github_repository" "overlay" {
  name        = "nahsi-overlay"
  description = "Personal ebuild collection"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "www" {
  name        = "www"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "dotfiles" {
  name = "dotfiles"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  topics = [
    "chezmoi",
    "dotfiles",
  ]

  delete_branch_on_merge = true
}

resource "github_repository" "pass" {
  name = "password-store"

  visibility = "private"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "presentations" {
  name = "presentations"

  visibility = "private"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "hashistack" {
  name = "hashistack"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  topics = [
    "consul",
    "nomad",
    "vault",
    "virtualbox",
    "service-mesh"
  ]

  delete_branch_on_merge = true
}
