return {
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			require("telescope").setup({
				defaults = {
					hidden = true,
					find_command = {
						"rg",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "   ",
					selection_strategy = "reset",
					sorting_strategy = "descending",
					layout_strategy = "vertical",
					layout_config = {
						horizontal = { mirror = false },
						vertical = { mirror = false },
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" }, -- "smart"
					winblend = 0,
					border = {}, --[[ borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, ]]
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					extensions = {
						file_browser = {
							theme = "ivy",
							hijack_netrw = true,
							mappings = {
								["i"] = {
									["<C-h>"] = fb_actions.goto_home_dir,
								},
								["n"] = {},
							},
						},
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default + actions.center,
							["<C-l>"] = actions.select_default + actions.center,
						},
						n = {
							["h"] = actions.close,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["l"] = actions.select_default + actions.center,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-e>"] = actions.smart_send_to_qflist + actions.open_qflist,
						},
					},
				},
				pickers = {
					buffers = {
						theme = "dropdown",
						initial_mode = "normal",
						previewer = false,
					},
					lsp_references = {
						theme = "ivy",
						initial_mode = "normal",
					},
					lsp_definitions = {
						theme = "ivy",
						initial_mode = "normal",
					},
					lsp_declarations = {
						theme = "ivy",
						initial_mode = "normal",
					},
					lsp_implementations = {
						theme = "ivy",
						initial_mode = "normal",
					},
				},
			})

			require("telescope").load_extension("noice")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("notify")
			require("telescope").load_extension("harpoon")

			local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)

			local purple0 = "#777777"
			local purple1 = "#292e42"
			local purple2 = "#282a36"
			local bg = "#21222c"
			local red1 = "#ff5555"
			local green1 = "#50fa7b"
			local blue2 = "#bd93f9"

			----------------------------------------------------------------------
			--                              Prompt                              --
			----------------------------------------------------------------------
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", {
				fg = purple2,
				bg = purple2,
			})

			vim.api.nvim_set_hl(0, "TelescopePromptNormal", {
				fg = blue2,
				bg = purple2,
			})

			vim.api.nvim_set_hl(0, "TelescopePromptTitle", {
				fg = bg,
				bg = blue2,
			})

			vim.api.nvim_set_hl(0, "TelescopePromptCounter", {
				fg = blue2,
				bg = purple2,
			})

			vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {
				fg = blue2,
				bg = purple2,
			})

			----------------------------------------------------------------------
			--                              Result                              --
			----------------------------------------------------------------------
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {
				fg = purple2,
				bg = purple2,
			})

			vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {
				fg = normal_hl.foreground,
				bg = purple2,
			})

			vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {
				--[[ fg = normal_hl.foreground, ]]
				fg = bg,
				bg = green1,
			})

			vim.api.nvim_set_hl(0, "TelescopeSelection", {
				fg = vim.api.nvim_get_hl_by_name("TelescopeSelection", true).foreground,
				bg = purple1,
			})

			vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {
				fg = purple0,
				bg = purple1,
			})

			----------------------------------------------------------------------
			--                             Preview                              --
			----------------------------------------------------------------------

			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {
				fg = purple1,
				bg = purple1,
			})

			vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {
				fg = normal_hl.foreground,
				bg = purple1,
			})

			vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {
				fg = bg,
				bg = red1,
			})

			vim.api.nvim_set_hl(0, "TelescopePreviewLine", {
				fg = normal_hl.foreground,
				bg = purple2,
			})

			vim.api.nvim_set_hl(0, "TelescopePreviewMatch", {
				fg = normal_hl.foreground,
				bg = purple1,
			})
		end,
	},
}
