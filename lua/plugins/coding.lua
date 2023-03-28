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
		"max397574/better-escape.nvim",
		event = "BufReadPre",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"woosaaahh/sj.nvim",
		event = "VeryLazy",
		config = function()
			local sj = require("sj")
			sj.setup()

			vim.keymap.set("n", "s", sj.run)
			vim.keymap.set("n", "<A-,>", sj.prev_match)
			vim.keymap.set("n", "<A-;>", sj.next_match)
			vim.keymap.set("n", "<localleader>sj", sj.redo)
		end,
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

	{ "JoosepAlviste/nvim-ts-context-commentstring" },
}
