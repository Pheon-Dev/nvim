local capability = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	require("lsp_signature").on_attach()
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

navic.setup({
	icons = {
		File = " ",
		Module = " ",
		Namespace = " ",
		Package = " ",
		Class = " ",
		Method = " ",
		Property = " ",
		Field = " ",
		Constructor = " ",
		Enum = "練",
		Interface = "練",
		Function = " ",
		Variable = " ",
		Constant = " ",
		String = " ",
		Number = " ",
		Boolean = "◩ ",
		Array = " ",
		Object = " ",
		Key = " ",
		Null = "ﳠ ",
		EnumMember = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	},
	highlight = false,
	separator = " » ",
	depth_limit = 0,
	depth_limit_indicator = "..",
})

require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capability,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

require("lspconfig").tsserver.setup({
	capabilities = capability,
	on_attach = on_attach,
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	init_options = {
		hostInfo = "neovim",
	},
	root_dir = function(fname)
		return vim.loop.cwd()
	end,
})

--[[ require("typescript").setup({ ]]
--[[ 	disable_commands = false, -- prevent the plugin from creating Vim commands ]]
--[[ 	debug = false, -- enable debug logging for commands ]]
--[[ 	go_to_source_definition = { ]]
--[[ 		fallback = true, -- fall back to standard LSP definition on failure ]]
--[[ 	}, ]]
--[[ 	server = { -- pass options to lspconfig's setup method ]]
--[[ 		on_attach = on_attach, ]]
--[[ 	}, ]]
--[[ }) ]]
