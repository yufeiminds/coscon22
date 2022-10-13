variable "organization" {
  type        = string
  description = "The name of Github organization"
}

variable "name" {
  type        = string
  description = "The name of team"
}

variable "description" {
  type        = string
  default     = ""
  description = "The description of team"
}

variable "members" {
  type = list(object({
    username = string
    role     = string
  }))
  default     = []
  description = "The members of team"
}
