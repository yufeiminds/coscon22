terraform {
  required_version = ">= 1.1"

  experiments = [module_variable_optional_attrs]

  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.3.0"
    }
  }
}
