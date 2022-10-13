resource "github_team" "main" {
  name        = var.name
  description = var.description
}

locals {
  members = {
    for member in var.members : member.username => member
  }
}

resource "github_team_membership" "main" {
  for_each = local.members

  team_id  = github_team.main.id
  username = each.key
  role     = each.value.role
}
