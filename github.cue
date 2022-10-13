package coscon22

github_config: {
	app_id:       30040780
	organization: "developer-led-engineering"
	teams: {
		"default": {
			"description": "The default team"
			"members": [
				{
					"username": "yufeiminds-bot"
					"role":     "member"
				},
				{
					"username": "yufeiminds"
					"role":     "member"
				},
			]
		}
	}
	repositories: {
		"example-go": {
			"description":        "An example for OSS repository management"
			"gitignore_template": "Go"
			"license_template":   "apache-2.0"
			"private":            true
			"teams": {
				"default": "admin"
			}
			"collaborators": {
				"yufeiminds-bot": "pull"
			}
		}
	}
}
