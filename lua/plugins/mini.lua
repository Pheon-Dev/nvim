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
}
