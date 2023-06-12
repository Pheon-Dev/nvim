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
			t["zb"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["zf"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
			t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
			t["zy"] = { "zt", { "250" } }
			t["zz"] = { "zz", { "250" } }
			t["ze"] = { "zb", { "250" } }

			require("neoscroll.config").set_mappings(t)
		end,
	},
	{
		"lewis6991/satellite.nvim",
		event = "BufReadPre",
		config = function()
			require("satellite").setup({
				current_only = false,
				winblend = 50,
				zindex = 40,
				excluded_filetypes = {},
				width = 2,
				handlers = {
					search = {
						enable = true,
					},
					diagnostic = {
						enable = true,
						signs = { "-", "=", "≡" },
						min_severity = vim.diagnostic.severity.HINT,
					},
					gitsigns = {
						enable = true,
						signs = { -- can only be a single character (multibyte is okay)
							add = "│",
							change = "│",
							delete = "-",
						},
					},
					marks = {
						enable = true,
						show_builtins = false, -- shows the builtin marks like [ ] < >
					},
				},
			})
		end,
	},
}

-- The :SatelliteDisable command disables scrollbars.
-- The :SatelliteEnable command enables scrollbars. This is only necessary if scrollbars have previously been disabled.
-- The :SatelliteRefresh command refreshes the scrollbars. This is relevant when the scrollbars are out-of-sync, which can occur as a result of some window arrangement actions.
--
