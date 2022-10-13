# Terarform Modules for Github Repository

**NOTE**: It is not a full-featured module, it according to the best practice present on CosCon 22' (China Open Source Conference).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version |
|---------------------------------------------------------------------------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2  |
| <a name="requirement_github"></a> [github](#requirement\_github)          | 5.3.0   |

## Providers

No providers.

## Modules

| Name                                                                     | Source               | Version |
|--------------------------------------------------------------------------|----------------------|---------|
| <a name="module_repositories"></a> [repositories](#module\_repositories) | ./modules/repository | n/a     |
| <a name="module_teams"></a> [teams](#module\_teams)                      | ./modules/team       | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                   | Description                      | Type                                                                                                                                                                                                                                                                                                                                                                      | Default | Required |
|------------------------------------------------------------------------|----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_organization"></a> [organization](#input\_organization) | The name of Github organization  | `string`                                                                                                                                                                                                                                                                                                                                                                  | n/a     |   yes    |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | The reposotories of organization | <pre>map(object({<br>    description        = optional(string)<br>    gitignore_template = optional(string)<br>    license_template   = optional(string)<br>    private            = optional(bool)<br>    application_ids    = optional(list(string))<br>    teams              = optional(map(string))<br>    collaborators      = optional(map(string))<br>  }))</pre> | `{}`    |    no    |
| <a name="input_teams"></a> [teams](#input\_teams)                      | The team members of organization | <pre>map(object({<br>    description = optional(string)<br>    members = list(object({<br>      username = string<br>      role     = string<br>    }))<br>  }))</pre>                                                                                                                                                                                                    | `{}`    |    no    |

## Outputs

| Name                                                | Description |
|-----------------------------------------------------|-------------|
| <a name="output_teams"></a> [teams](#output\_teams) | n/a         |
<!-- END_TF_DOCS -->
