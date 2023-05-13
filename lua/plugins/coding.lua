return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},
	{
		"xiyaowong/virtcolumn.nvim",
		event = "BufReadPre",
	},
	{
		"utilyre/sentiment.nvim",
		event = "BufReadPre",
		config = function()
			require("sentiment").setup({})
		end,
	},
}
