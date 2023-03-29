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
			-- lua, default settings
			require("better_escape").setup({
				mapping = { "jj" }, -- a table with mappings to use
				timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
				-- example(recommended)
				-- keys = function()
				--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
				-- end,
			})
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
