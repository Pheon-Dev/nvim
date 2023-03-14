return {

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		-- version = "<CurrentMajor>.*",
		-- install jsregexp (optional!).
		-- build = "make install_jsregexp",
		-- config = {
		-- 	history = true,
		-- 	delete_check_events = "TextChanged",
		-- },
		-- init = function()
		-- 	local function jump(key, dir)
		-- 		vim.keymap.set({ "i", "s" }, key, function()
		-- 			return require("luasnip").jump(dir) or key
		-- 		end, { expr = true })
		-- 	end
		-- 	jump("<tab>", 1)
		-- 	jump("<s-tab>", -1)
		-- end,
	},

	{
		"xiyaowong/virtcolumn.nvim",
		event = "BufReadPre",
	},
	{
		"echasnovski/mini.splitjoin",
		event = "VeryLazy",
		config = function()
			require("mini.splitjoin").setup({})
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup({})
		end,
	},
	{
		"utilyre/sentiment.nvim",
		event = "BufReadPre",
		config = function()
			require("sentiment").setup({})
		end,
	},

	-- surround
	{
		"echasnovski/mini.surround",
		keys = { "gz" },
		config = function()
			-- use gz mappings instead of s to prevent conflict with leap
			require("mini.surround").setup({
				mappings = {
					add = "gza", -- Add surrounding in Normal and Visual modes
					delete = "gzd", -- Delete surrounding
					find = "gzf", -- Find surrounding (to the right)
					find_left = "gzF", -- Find surrounding (to the left)
					highlight = "gzh", -- Highlight surrounding
					replace = "gzr", -- Replace surrounding
					update_n_lines = "gzn", -- Update `n_lines`
				},
			})
		end,
	},

	-- comments
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require("mini.comment").setup({
				hooks = {
					pre = function()
						require("ts_context_commentstring.internal").update_commentstring({})
					end,
				},
			})
		end,
	},
}
