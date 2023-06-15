return {
	"gbprod/yanky.nvim",
	event = "BufReadPre",
	config = function()
		local theme = require("core.colors")
		require("yanky").setup({
			ring = {
				history_length = 100,
				storage = "shada", -- sqlite "kkharji/sqlite.lua",
				sync_with_numbered_registers = true,
				cancel_event = "update",
			},
			system_clipboard = {
				sync_with_ring = true,
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 500,
			},
		})
		vim.api.nvim_set_hl(0, "YankyYanked", { bg = theme.color65 })
		vim.api.nvim_set_hl(0, "YankyPut", { bg = theme.color93 })
	end,
}
