return {
	{
		"folke/trouble.nvim",
		event = "BufReadPre",
		cmd = { "TroubleToggle", "Trouble" },
		config = {
			position = "bottom", -- position of the list can be: bottom, top, left, right
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
	-- {
	-- 	"kevinhwang91/nvim-bqf",
	-- 	event = "BufReadPre",
	-- 	config = function()
	-- 		require("bqf").setup({
	-- 			auto_enable = true,
	-- 			magic_window = true,
	-- 			auto_resize_height = true, -- highly recommended enable
	-- 			preview = {
	-- 				auto_preview = true,
	-- 				win_height = 12,
	-- 				win_vheight = 12,
	-- 				delay_syntax = 80,
	-- 				border_chars = { "│", "│", "─", "─", "╭", "╮", "╰", "╯", "█" },
	-- 				show_title = true,
	-- 				wrap = false,
	-- 				buf_label = true,
	-- 				should_preview_cb = function(bufnr, qwinid)
	-- 					local ret = true
	-- 					local bufname = vim.api.nvim_buf_get_name(bufnr)
	-- 					local fsize = vim.fn.getfsize(bufname)
	-- 					if fsize > 100 * 1024 then
	-- 						-- skip file size greater than 100k
	-- 						ret = false
	-- 					elseif bufname:match("^fugitive://") then
	-- 						-- skip fugitive buffer
	-- 						ret = false
	-- 					end
	-- 					return ret
	-- 				end,
	-- 			},
	-- 			-- make `drop` and `tab drop` to become preferred
	-- 			func_map = {
	-- 				drop = "l",
	-- 				openc = "O",
	-- 				split = "<C-s>",
	-- 				tabdrop = "<C-t>",
	-- 				-- set to empty string to disable
	-- 				tabc = "",
	-- 				ptogglemode = "z,",
	-- 			},
	-- 			filter = {
	-- 				fzf = {
	-- 					action_for = {
	-- 						["ctrl-s"] = "split",
	-- 						["ctrl-T"] = "tab drop",
	-- 						["ctrl-t"] = "tabedit",
	-- 						["ctrl-v"] = "vsplit",
	-- 						["ctrl-x"] = "split",
	-- 						["ctrl-q"] = "signtoggle",
	-- 						["ctrl-c"] = "closeall",
	-- 					},
	-- 					extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", " " },
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
