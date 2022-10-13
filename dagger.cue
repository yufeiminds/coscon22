package coscon22

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"

	"yufeiminds.com/coscon22"
)

dagger.#Plan & {
	client: env: {
		GITHUB_TOKEN:   dagger.#Secret
		TF_CLOUD_TOKEN: dagger.#Secret
	}

	actions: apply: {
		tfSource: core.#Source & {
			path: "."
		}

		// init: coscon22.#Login & {
		//  token: client.env.TF_CLOUD_TOKEN
		// }

		github: coscon22.#ApplyGithub & {
			dir: tfSource.output

			config: github_config

			options: {
				terraform_cloud: {
					organization: "developer-led-engineering"
					workspace:    "coscon22"
					token: client.env.TF_CLOUD_TOKEN
				}
			}

			env: {
				GITHUB_TOKEN:   client.env.GITHUB_TOKEN
			}
		}
	}
}
