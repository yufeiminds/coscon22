variable "organization" {
  type        = string
  description = "The name of Github organization"
}

variable "name" {
  type        = string
  description = "The name of Github repository"
}

variable "description" {
  type        = string
  default     = ""
  description = "The description of Github repository"
}

variable "private" {
  type        = bool
  default     = false
  description = "If the repository is private"
}

variable "homepage_url" {
  type        = string
  default     = ""
  description = "The homepage url of Github repository"
}

variable "topics" {
  type        = list(string)
  default     = []
  description = "The topics of Github repository"
}

variable "gitignore_template" {
  type        = string
  default     = ""
  description = "The initialize gitignore template for Github repository. See also: https://github.com/github/gitignore"
}

variable "license_template" {
  type        = string
  default     = ""
  description = "The initialize license template for Github repository. See also: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses"
}

variable "application_ids" {
  type        = set(string)
  default     = []
  description = "The applications IDs of Github repository"
}

variable "teams" {
  type        = map(string)
  default     = {}
  description = "The teams of Github repository, key is teams name and value if permission"
}

variable "collaborators" {
  type        = map(string)
  default     = {}
  description = "The collaborators of Github repository, key is username and value if permission"
}
