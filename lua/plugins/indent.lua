return {
	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		event = "BufReadPre",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "alpha", "lazy", "NvimTree" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup({
				symbol = "│",
				-- symbol = "┊",
				options = { try_as_border = true },
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = {
			char = "│", -- '|', '¦', '┆', '┊', '│', '▏'
			show_trailing_blankline_indent = false,
			show_current_context = false,
			buftype_exclude = { "terminal" },
			filetype_exclude = {
				"help",
				"alpha",
				"nvim-tree",
				"NvimTree",
				"Trouble",
				"lazy",
				"dashboard",
				"packer",
				"mason-lspconfig",
				"mason",
				"lspsaga",
				"noice",
				"lir",
				"harpoon",
				"TelescopePrompt",
			},
			show_current_context_start = false,
			context_patterns = {
				"class",
				"return",
				"function",
				"method",
				"^if",
				"^while",
				"jsx_element",
				"^for",
				"^object",
				"^table",
				"block",
				"arguments",
				"if_statement",
				"else_clause",
				"jsx_element",
				"jsx_self_closing_element",
				"try_statement",
				"catch_clause",
				"import_statement",
				"operation_type",
			},
		},
	},
}
