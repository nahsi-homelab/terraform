resource "github_repository" "files-to-matrix" {
  name                   = "files-to-matrix"
  delete_branch_on_merge = true

  has_wiki   = false
  has_issues = true

  allow_merge_commit = false
  allow_rebase_merge = false
}

resource "github_repository" "setup-nomad" {
  name                   = "setup-nomad"
  delete_branch_on_merge = true

  has_wiki   = false
  has_issues = true

  allow_merge_commit = false
  allow_rebase_merge = false
}
