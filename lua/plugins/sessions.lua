return {
	{
		"ibhagwan/fzf-lua",
		event = "VeryLazy",
		config = function()
			local theme = require("config.colors")

			vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = theme.color2, bg = theme.color0 })

			vim.api.nvim_set_hl(0, "FzfLuaCursor", { fg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaCursorLine", { fg = theme.color89, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaCursorLineNr", { fg = theme.color7, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaSearch", { fg = theme.color100, bg = theme.color0 })

			vim.api.nvim_set_hl(0, "FzfLuaHelpNormal", { bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaTitle", { fg = theme.color0, bg = theme.color89 })

			vim.api.nvim_set_hl(0, "FzfLuaScrollBorderEmpty", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaScrollBorderFull", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaScrollFloatEmpty", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaScrollFloatFull", { fg = theme.color2, bg = theme.color0 })

			vim.api.nvim_set_hl(0, "FzfLuaHelpBorder", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "FzfLuaHelpNormal", { bg = theme.color0 })

			require("fzf-lua").setup({
				"telescope", -- max-perf, fzf-native, default, fzf-tmux, skim, telescope
				winopts = {
					-- split         = "belowright new",-- open in a split instead?
					-- "belowright new"  : split below
					-- "aboveleft new"   : split above
					-- "belowright vnew" : split right
					-- "aboveleft vnew   : split left
					-- Only valid when using a float window
					-- (i.e. when 'split' is not defined, default)
					height = 0.85, -- window height
					width = 0.80, -- window width
					row = 0.35, -- window row position (0=top, 1=bottom)
					col = 0.50, -- window col position (0=left, 1=right)
					-- border argument passthrough to nvim_open_win(), also used
					-- to manually draw the border characters around the preview
					-- window, can be set to 'false' to remove all borders or to
					-- 'none', 'single', 'double', 'thicc' or 'rounded' (default)
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					-- requires neovim > v0.9.0, passed as is to `nvim_open_win`
					-- can be sent individually to any provider to set the win title
					title = "Possession",
					title_pos = "center", -- 'left', 'center' or 'right'
					fullscreen = false, -- start fullscreen?
					preview = {
						-- default     = 'bat',           -- override the default previewer?
						-- default uses the 'builtin' previewer
						border = "border", -- border|noborder, applies only to
						-- native fzf previewers (bat/cat/git/etc)
						wrap = "nowrap", -- wrap|nowrap
						hidden = "nohidden", -- hidden|nohidden
						vertical = "down:45%", -- up|down:size
						horizontal = "right:60%", -- right|left:size
						layout = "flex", -- horizontal|vertical|flex
						flip_columns = 120, -- #cols to switch to horizontal on flex
						-- Only used with the builtin previewer:
						title = true, -- preview border title (file/buf)?
						title_align = "left", -- left|center|right, title alignment
						scrollbar = "float", -- `false` or string:'float|border'
						-- float:  in-window floating border
						-- border: in-border chars (see below)
						scrolloff = "-2", -- float scrollbar offset from right
						-- applies only when scrollbar = 'float'
						scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
						-- applies only when scrollbar = 'border'
						delay = 100, -- delay(ms) displaying the preview
						-- prevents lag on fast scrolling
						winopts = {
							-- builtin previewer window options
							number = true,
							relativenumber = false,
							cursorline = true,
							cursorlineopt = "both",
							cursorcolumn = false,
							signcolumn = "no",
							list = false,
							foldenable = false,
							foldmethod = "manual",
						},
					},
					on_create = function()
						-- called once upon creation of the fzf main window
						-- can be used to add custom fzf-lua mappings, e.g:
						-- vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
					end,
				},
			})
		end,
	},
	{
		"gennaro-tedesco/nvim-possession",
		event = "VeryLazy",
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		config = function()
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
