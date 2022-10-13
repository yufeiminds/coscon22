variable "organization" {
  type        = string
  description = "The name of Github organization"
}

variable "teams" {
  type = map(object({
    description = optional(string)
    members = list(object({
      username = string
      role     = string
    }))
  }))
  default     = {}
  description = "The team members of organization"
}

variable "repositories" {
  type = map(object({
    description        = optional(string)
    gitignore_template = optional(string)
    license_template   = optional(string)
    private            = optional(bool)
    application_ids    = optional(list(string))
    teams              = optional(map(string))
    collaborators      = optional(map(string))
  }))
  default     = {}
  description = "The reposotories of organization"
}
