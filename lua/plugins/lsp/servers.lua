-- Add any servers here together with their settings
local util = require("lspconfig.util")
---@type lspconfig.options
local servers = {
	gopls = {},
	clangd = {},
  -- lua_ls = {
  --   settings = {
  --     lua = {
  --       completion = {
  --         callSnippet = "Replace",
  --       },
  --     }
  --   }
  -- },
	-- codelldb = {},
	-- bashls = {},
	-- cssls = {},
	-- tsserver = {},
	html = {},
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
