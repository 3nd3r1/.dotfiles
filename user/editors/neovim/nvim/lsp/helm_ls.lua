return {
	settings = {
		["helm-ls"] = {
			valuesFiles = {
				mainValuesFile = "values.yaml",
				lintOverlayValuesFile = "values.lint.yaml",
				additionalValuesFilesGlobPattern = "values.*.yaml",
			},
			yamlls = {
				enabled = true,
				diagnosticsLimit = 50,
				path = "yaml-language-server",
				showDiagnosticsDirectly = false,
				config = {
					schemas = {
						kubernetes = "templates/**",
					},
					completion = true,
					hover = true,
				},
			},
		},
	},
}
