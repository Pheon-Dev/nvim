return {
	"m4xshen/hardtime.nvim",
	event = "BufReadPre",
	opts = {},
	config = function()
		require("hardtime").setup({
			max_time = 1000,
			max_count = 5,
			disable_mouse = true,
			hint = true,
			allow_different_key = false,
      resetting_keys = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "c", "d", "x", "X", "p", "P" },
			-- restricted_keys = { "h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
			restricted_keys = { "h", "j", "k", "l" },
			hint_keys = { "^", "$", "a", "i", "d", "y", "c", "l" },
			-- disabled_keys = { "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
			disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "harpoon",
      },
		})
	end,
}
