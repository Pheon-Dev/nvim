return {
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
			local ok, neoscroll = pcall(require, "neoscroll")

			if not ok then
				return
			end

			neoscroll.setup({})

			-- Syntax scrolling function: `scroll(lines, move_cursor, time[, easing_function_name])`
			local t = {}
			-- Syntax: t[keys] = {function, {function arguments}}
			t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
			t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
			t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
			t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
			t["zt"] = { "zt", { "250" } }
			t["zz"] = { "zz", { "250" } }
			t["zb"] = { "zb", { "250" } }

			require("neoscroll.config").set_mappings(t)
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		event = "VeryLazy",
		config = function()
			local colors = require("tokyonight.colors").setup()

			require("scrollbar").setup({
				show = true,
				show_in_active_only = false,
				set_highlights = true,
				folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
				max_lines = false, -- disables if no. of lines in buffer exceeds this
				handle = {
					text = " ",
					color = colors.bg_highlight1,
					cterm = nil,
					highlight = "CursorColumn",
					hide_if_all_visible = true, -- Hides handle if all lines are visible
				},
				marks = {
					Search = {
						text = { "-", "=" },
						priority = 0,
						color = colors.orange,
						cterm = nil,
						highlight = "Search",
					},
					Error = {
						text = { "-", "=" },
						priority = 1,
						color = colors.error,
						cterm = nil,
						highlight = "DiagnosticVirtualTextError",
					},
					Warn = {
						text = { "-", "=" },
						priority = 2,
						color = colors.warning,
						cterm = nil,
						highlight = "DiagnosticVirtualTextWarn",
					},
					Info = {
						text = { "-", "=" },
						priority = 3,
						color = colors.info,
						cterm = nil,
						highlight = "DiagnosticVirtualTextInfo",
					},
					Hint = {
						text = { "-", "=" },
						priority = 4,
						color = colors.hint,
						cterm = nil,
						highlight = "DiagnosticVirtualTextHint",
					},
					Misc = {
						text = { "-", "=" },
						priority = 5,
						color = colors.purple,
						cterm = nil,
						highlight = "Normal",
					},
				},
				excluded_buftypes = {
					"terminal",
				},
				excluded_filetypes = {
					"prompt",
					"TelescopePrompt",
					"noice",
				},
				autocmd = {
					render = {
						"BufWinEnter",
						"TabEnter",
						"TermEnter",
						"WinEnter",
						"CmdwinLeave",
						"TextChanged",
						"VimResized",
						"WinScrolled",
					},
					clear = {
						"BufWinLeave",
						"TabLeave",
						"TermLeave",
						"WinLeave",
					},
				},
				handlers = {
					diagnostic = true,
					search = true, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
				},
			})

			--[[ require("scrollbar.handlers").register(name, handler_function) ]]
			--[[ require("scrollbar.handlers").register("my_marks", function(bufnr) ]]
			--[[     return { ]]
			--[[         { line = 0 }, ]]
			--[[         { line = 1, text = "x", type = "Warn" }, ]]
			--[[         { line = 2, type = "Error" } ]]
			--[[     } ]]
			--[[ end) ]]
		end,
	},
}
