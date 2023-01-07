return {
	{
		"onsails/diaglist.nvim",
		config = function()
			require("diaglist").init({
				-- optional settings
				-- below are defaults
				debug = false,

				-- increase for noisy servers
				debounce_ms = 150,
			})

			require("lsp_lines").setup()
		end,
	},
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		-- config = true,
	},

	{
		"folke/trouble.nvim",
		event = "BufReadPre",
		cmd = { "TroubleToggle", "Trouble" },
		config = {
			position = "left", -- position of the list can be: bottom, top, left, right
			height = 10, -- height of the trouble list when position is top or bottom
			width = 30, -- width of the list when position is left or right
			icons = true, -- use devicons for filenames
			mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
			fold_open = "", -- icon used for open folds
			fold_closed = "❯", -- icon used for closed folds
			group = true, -- group results by file
			padding = true, -- add an extra new line on top of the list
			action_keys = { -- key mappings for actions in the trouble list
				-- map to {} to remove a mapping, for example:
				-- close = {},
				close = "q", -- close the list
				cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
				refresh = "r", -- manually refresh
				jump = { "<cr>", "<tab>", "l" }, -- jump to the diagnostic or open / close folds
				open_split = { "<c-x>" }, -- open buffer in new split
				open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
				open_tab = { "<c-t>" }, -- open buffer in new tab
				jump_close = { "o" }, -- jump to the diagnostic and close the list
				toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
				toggle_preview = "P", -- toggle auto_preview
				hover = "K", -- opens a small popup with the full multiline message
				preview = "p", -- preview the diagnostic location
				close_folds = { "zM", "zm" }, -- close all folds
				open_folds = { "zR", "zr" }, -- open all folds
				toggle_fold = { "zA", "za", "h" }, -- toggle fold of current file
				previous = "k", -- previous item
				next = "j", -- next item
			},
			indent_lines = true, -- add an indent guide below the fold icons
			auto_open = false, -- automatically open the list when you have diagnostics
			auto_close = false, -- automatically close the list when you have no diagnostics
			auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
			auto_fold = false, -- automatically fold a file trouble list at creation
			auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
			signs = {
				-- icons / text used for a diagnostic
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "﫠",
			},
			use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
		},
	},
}
