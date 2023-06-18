return {
	-- better vim.notify
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>nc",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Clear all Notifications",
			},
		},
		config = function()
			require("notify").setup({
				background_colour = "Normal",
				fps = 30,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = "",
				},
				level = 2,
				-- minimum_width = 50,
				render = "minimal", -- compact, minimal, simple, default
				stages = "slide",
				top_down = true,
				timeout = 3000,
				max_height = function()
					return math.floor(vim.o.lines * 0.75)
				end,
				max_width = function()
					return math.floor(vim.o.columns * 0.35)
				end,
			})
		end,
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- ui components
	"MunifTanjim/nui.nvim",
	"nvim-lua/popup.nvim",
}
