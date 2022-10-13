module "teams" {
  providers = {
    github = github.main
  }

  source = "./modules/team"

  for_each = var.teams

  organization = var.organization
  name         = each.key
  description  = each.value.description
  members      = each.value.members
}

module "repositories" {
  providers = {
    github = github.main
  }

  source = "./modules/repository"

  for_each = var.repositories

  organization       = var.organization
  name               = each.key
  description        = each.value.description
  gitignore_template = each.value.gitignore_template
  license_template   = each.value.license_template
  private            = each.value.private
  application_ids    = each.value.application_ids
  teams              = each.value.teams
  collaborators      = each.value.collaborators

  depends_on = [
    module.teams
  ]
}

provider "github" {
  alias = "main"
  owner = var.organization
}
