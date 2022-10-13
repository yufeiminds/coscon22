package coscon22

import (
	"dagger.io/dagger"
)

// #GithubConfig: {
// 	app_id: string
// 	organization: string
// 	teams: [string]: #Team
// 	repositories: [string]: #Repository
// }

// #Repository: {
// 	description: string
// 	gitignore_template: string
// 	license_template: string
// 	private: string
// 	teams: [string]: string
// 	collaborators: [string]: string
// }

// #Team: {
//     description: string
//     members: [#TeamMember]
// }

// #TeamMember: {
//     username: string
//     role: string
// }

#Login: {
    source: dagger.#FS

    output: dagger.#FS
}

#ApplyGithub: #ApplyTerraformModule & {
	dir: dagger.#FS

	config: _

	module: "./modules/terraform-github-repositories"

	variables: {
        app_id: config.app_id
        organization: config.organization

        teams: {
            for k, v in config.teams {
                (k): v & {
                    "organization":       "\(organization)"
                }
            }
        }

        repositories: {
            for k, v in config.repositories {
                (k): v & {
                    "organization":       "\(organization)"
                    "application_ids": [
                        app_id,
                    ]
                }
            }
        }
    }
}
