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

resource "github_repository" "workflow-job-handler" {
  name = "workflow-job-handler"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  topics = [
    "nomad",
    "github-actions",
    "nomad-autoscaler"
  ]

  delete_branch_on_merge = true
}
