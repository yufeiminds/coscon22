module "demo" {
  source = "../.."

  organization = "developer-led-engineering"

  repositories = {
    "example-go" = {
      description        = "An example for OSS repository management"
      gitignore_template = "Go"
      license_template   = "apache-2.0"
      private            = true

      application_ids = [
        30040780
      ]

      teams = {
        "default" : "admin"
      }

      collaborators = {
        "yufeiminds-bot" : "pull"
      }
    }
  }

  teams = {
    default = {
      description = "The default team"
      members = [
        {
          username = "yufeiminds-bot"
          role     = "member"
        },
        {
          username = "yufeiminds"
          role     = "member"
        }
      ]
    }
  }
}
