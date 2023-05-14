return {
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup({})
		end,
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
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup({})
		end,
	},
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
