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
	{ "kevinhwang91/nvim-hlslens", config = true },

	"jghauser/mkdir.nvim",
	"mbbill/undotree",
	{ "norcalli/nvim-colorizer.lua", event = "VeryLazy", config = true },
	{
		"ray-x/sad.nvim",
		config = function()
			require("sad").setup({
				diff = "diff-so-fancy", -- you can use `diff`, `diff-so-fancy`
				ls_file = "fd", -- also git ls_file
				exact = false, -- exact match
				vsplit = true, -- split sad window the screen vertically, when set to number
				-- it is a threadhold when window is larger than the threshold sad will split vertically,
				height_ratio = 0.6, -- height ratio of sad window when split horizontally
				width_ratio = 0.6, -- height ratio of sad window when split vertically
			})
		end,
	},
	-- "ray-x/navigator.lua",
	{
		"toppair/reach.nvim",
		config = function()
			if not vim.fn.filetype == "dashboard" then
				local mark_opts = {
					filter = function(mark)
						return mark:match("[a-zA-Z]") -- return true to disable
					end,
					-- A map of action to key that should be used to invoke it
					actions = {
						split = "-",
						vertsplit = "/",
						tabsplit = "]",
						delete = "<Space>",
					},
				}

				require("reach").marks(mark_opts)
			end
		end,
	},
	"haringsrob/nvim_context_vt",
	{ "mg979/vim-visual-multi", branch = "master", event = "BufReadPre" },
	--[[ { "phaazon/hop.nvim", branch = "v2" }, ]]
}
