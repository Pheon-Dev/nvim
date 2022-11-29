local null_ls = require("null-ls")

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "eslint_d", "gitsigns" },
})

require("mason-null-ls").setup_handlers({
	function(source_name, methods)
		null_ls.register(null_ls.builtins.completion.spell)
		require("mason-null-ls.automatic_setup")(source_name, methods)
	end,
	--[[ prettierd = null_ls.register(null_ls.builtins.formatting.prettierd), ]]
	--[[ gitsigns = null_ls.register(null_ls.builtins.code_actions.gitsigns), ]]
	stylua = null_ls.register(null_ls.builtins.formatting.stylua),
	--[[ prettierd = null_ls.register(null_ls.builtins.formatting.prettierd), ]]
	eslint_d = null_ls.register(null_ls.builtins.diagnostics.eslint_d),
})

null_ls.setup()
