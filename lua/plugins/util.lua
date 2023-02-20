return {
	"lewis6991/impatient.nvim",
	"nathom/filetype.nvim",
	{
		"imsnif/kdl.vim",
		event = "VeryLazy",
	},

	-- measure startuptime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- persistence
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = true,
	},
	"nvim-lua/plenary.nvim",
	-- {
	-- 	"lukas-reineke/virt-column.nvim",
	-- 	event = "VeryLazy",
	-- 	config = true,
	-- },

	--[[ Notifications ]]
	{
		"rcarriga/nvim-notify",
		config = true,
	},
	"Pheon-Dev/harpoon",
	-- "ThePrimeagen/harpoon",
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
	{ "kevinhwang91/nvim-hlslens", config = true },

	"ckipp01/stylua-nvim",
	{ "mg979/vim-visual-multi", branch = "master", event = "BufReadPre" },
}
