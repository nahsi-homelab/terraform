resource "github_repository" "overlay" {
  name        = "nahsi-overlay"
  description = "Personal ebuild collection"

  has_issues   = false
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "pass" {
  name = "password-store"

  visibility = "private"

  has_issues   = false
  has_projects = false
  has_wiki     = false
}
