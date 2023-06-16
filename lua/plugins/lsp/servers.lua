-- Add any servers here together with their settings
local util = require("lspconfig.util")
---@type lspconfig.options
local servers = {
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
	-- codelldb = {},
	-- bashls = {},
	-- cssls = {},
	-- tsserver = {},
	-- html = {},
	-- jsonls = {},
	-- pyright = {},
	-- yamlls = {},
	-- remark_ls = {},
	rust_analyzer = { -- rustup component add rust-analyzer
		cmd = { "rustup", "run", "stable", "rust-analyzer" },
	},
	sumneko_lua = {
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = false,
				},
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
}

return servers
