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
		"TheBlob42/houdini.nvim",
		event = "BufReadPre",
		config = function()
			-- default settings
			require("houdini").setup({
				mappings = { "jj" },
				timeout = vim.o.timeoutlen,
				check_modified = true,
				escape_sequences = {
					i = "<BS><BS><ESC>",
					R = "<BS><BS><ESC>",
					t = "<BS><BS><C-\\><C-n>",
					c = "<BS><BS><C-c>",
				},
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
