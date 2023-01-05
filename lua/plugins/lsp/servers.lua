-- Add any servers here together with their settings
local util = require("lspconfig.util")
---@type lspconfig.options
local servers = {
	bashls = {},
	gopls = {
		cmd = { "gopls", "serve" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		single_file_support = true,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	},
	clangd = {},
	cssls = {},
	tsserver = {},
	html = {},
	jsonls = {},
	pyright = {},
	yamlls = {},
	sumneko_lua = {
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = false,
				},
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
}

return servers
