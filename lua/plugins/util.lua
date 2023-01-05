return {

	-- measure startuptime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- library used by other plugins
	"nvim-lua/plenary.nvim",

	--[[ Notifications ]]
	{
		"rcarriga/nvim-notify",
		config = true,
	},
	"Pheon-Dev/harpoon",
	"SmiteshP/nvim-navic",
	{
		"booperlv/nvim-gomove",
		event = "VeryLazy",
		config = function()
			require("gomove").setup({
				-- whether or not to map default key bindings, (true/false)
				map_defaults = false,
				-- whether or not to reindent lines moved vertically (true/false)
				reindent = true,
				-- whether or not to undojoin same direction moves (true/false)
				undojoin = true,
				-- whether to not to move past end column when moving blocks horizontally, (true/false)
				move_past_end_col = false,
			})
		end,
	},
	"xiyaowong/virtcolumn.nvim",
	"xiyaowong/link-visitor.nvim",
		{ "kevinhwang91/nvim-hlslens" },
		{ "mg979/vim-visual-multi", branch = "master", event = "BufReadPre" },
	--[[ { "phaazon/hop.nvim", branch = "v2" }, ]]
}
