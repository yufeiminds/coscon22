package coscon22

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
	"encoding/json"

	"universe.dagger.io/alpha/terraform"
)

#ApplyTerraformModule: {
	dir: dagger.#FS

	module: string

	env: [string]: string | dagger.#Secret

	variables: _

	options: {
		terraform_cloud: {
			organization: string
			workspace: string
			token: string | dagger.#Secret
		}
		
		dry_run?: bool | false
	}

	workflow: {
		generate: {
			_credential: {
				"credentials": {
					"app.terraform.io": {
						"token": options.terraform_cloud.token
					}
				}
			}
			
			_code: {
				"module": "main": {
					"source": module
				}
				"module": "main": variables
				"terraform": {
                    cloud: {
                        organization: options.terraform_cloud.organization
                        workspaces: [
                            {
                                name: options.terraform_cloud.workspace
                            }
                        ]
                    }
                }
			}

			credential: {
				_mkdir: core.#Mkdir & {
					input:    dir
					path: "~/.terraform.d"
				}
				_write: core.#WriteFile & {
					input:    _mkdir.output
					path:     "~/.terraform.d/credentials.tfrc.json"
					contents: json.Marshal(_credential)
				}
				output: _write.output
			}

			code: core.#WriteFile & {
				input:    credential.output
				path:     "main.tf.json"
				contents: json.Marshal(_code)
			}

			output: code.output
		}

		init: terraform.#Init & {
			source: generate.output

			withinEnv: env
		}

		plan: terraform.#Plan & {
			source: init.output

			withinEnv: env
		}

		apply: terraform.#Apply & {
			source: plan.output

			withinEnv: env
		}
	}

	output: workflow.apply.output

	...
}
