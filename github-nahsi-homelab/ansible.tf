resource "github_repository" "ansible-consul" {
  name = "ansible-consul"

  has_issues = true
  has_wiki   = false

  topics = [
    "ansible",
    "consul",
    "hashicorp"
  ]

  delete_branch_on_merge = true
}
