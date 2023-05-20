return {
	{
		"gennaro-tedesco/nvim-possession",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		config = function()
			local theme = require("config.colors")

			vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = theme.color2, bg = theme.color0 })

			vim.api.nvim_set_hl(0, "FzfLuaCursor", { fg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaCursorLine", { fg = theme.color89, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaCursorLineNr", { fg = theme.color7, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaSearch", { fg = theme.color100, bg = theme.color0 })

			vim.api.nvim_set_hl(0, "FzfLuaHelpNormal", { bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaTitle", { fg = theme.color7, bg = theme.color0 })

			vim.api.nvim_set_hl(0, "FzfLuaScrollBorderEmpty", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaScrollBorderFull", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaScrollFloatEmpty", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaScrollFloatFull", { fg = theme.color2, bg = theme.color0 })

			vim.api.nvim_set_hl(0, "FzfLuaHelpBorder", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaHelpNormal", { bg = theme.color0 })

			require("fzf-lua").setup({
				"telescope", -- max-perf, fzf-native, default, fzf-tmux, skim, telescope
			})
			require("nvim-possession").setup({
				sessions = {
					sessions_path = vim.fn.stdpath("data") .. "/sessions/",
					-- sessions_path = ... -- folder to look for sessions, must be a valid existing path
					--     sessions_variable = .. -- defines vim.g[sessions_variable] when a session is loaded
					--     sessions_icon = ...
				},
				--
				autoload = false, -- whether to autoload sessions in the cwd at startup
				autosave = true, -- whether to autosave loaded sessions before quitting
				autoswitch = {
					enable = false, -- whether to enable autoswitch
					exclude_ft = {}, -- list of filetypes to exclude from autoswitch
				},

				post_hook = nil, -- callback, function to execute after loading a session
				-- useful to restore file trees, file managers or terminals
				-- function()
				--     require('FTerm').open()
				--     require('nvim-tree').toggle(false, true)
				-- end

				fzf_winopts = {
					-- any valid fzf-lua winopts options, for instance
					width = 0.5,
					-- preview = {
					-- 	vertical = "right:30%",
					-- },
				},
			})
		end,
		init = function()
			local possession = require("nvim-possession")
			vim.keymap.set("n", "<leader>pp", function()
				possession.list()
			end, { desc = "List sessions" })
			vim.keymap.set("n", "<leader>pn", function()
				possession.new()
			end, { desc = "New session" })
			vim.keymap.set("n", "<leader>pu", function()
				possession.update()
			end, { desc = "Update session" })
			vim.keymap.set("n", "<leader>pd", function()
				possession.delete()
			end, { desc = "Delete session" })
		end,
	},
}
