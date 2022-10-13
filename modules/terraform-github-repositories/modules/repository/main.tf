resource "github_repository" "main" {
  name         = var.name
  description  = var.description
  homepage_url = var.homepage_url

  visibility = var.private ? "private" : "public"

  gitignore_template = var.gitignore_template
  license_template   = var.license_template

  has_issues   = true
  has_projects = true

  allow_auto_merge   = false
  allow_rebase_merge = false
  allow_squash_merge = true
  allow_merge_commit = false

  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "BLANK"

  topics               = var.topics
  vulnerability_alerts = true
}

resource "github_app_installation_repository" "apps" {
  for_each = var.application_ids

  # The installation id of the app (in the organization).
  installation_id = each.value
  repository      = github_repository.main.name
}

resource "github_team_repository" "main" {
  for_each   = var.teams
  repository = github_repository.main.name
  team_id    = each.key
  permission = each.value
}

resource "github_repository_collaborator" "main" {
  for_each   = var.collaborators
  repository = github_repository.main.name
  username   = each.key
  permission = each.value
}
