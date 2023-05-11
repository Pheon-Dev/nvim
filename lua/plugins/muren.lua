return {
	"AckslD/muren.nvim",
	event = "BufReadPre",
	config = function()
		require("muren").setup({
			-- general
			create_commands = true,
			filetype_in_preview = true,
			-- default togglable options
			two_step = false,
			all_on_line = true,
			preview = true,
			-- keymaps
			keys = {
				close = "q",
				toggle_side = "<Tab>",
				toggle_options_focus = "<C-s>",
				toggle_option_under_cursor = "<CR>",
				scroll_preview_up = "<Up>",
				scroll_preview_down = "<Down>",
				do_replace = "<CR>",
			},
			-- ui sizes
			patterns_width = 30,
			patterns_height = 10,
			options_width = 15,
			preview_height = 16,
			-- options order in ui
			order = {
				"buffer",
				"two_step",
				"all_on_line",
				"preview",
			},
			-- highlights used for options ui
			hl = {
				options = {
					on = "@string",
					off = "@variable.builtin",
				},
			},
		})
	end,
}
