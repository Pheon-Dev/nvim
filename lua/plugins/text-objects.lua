return {
	{
		"kana/vim-textobj-user",
		event = "BufReadPre",
		dependencies = {
			"beloglazov/vim-textobj-quotes",
			"kana/vim-textobj-entire",
		},
		config = function()
			vim.keymap.set("n", "q", "iq", { noremap = true, silent = true })
		end,
	},
	{
		"glts/vim-textobj-comment",
		keys = {
			{ "ic", mode = { "o", "x" }, desc = "Select comment block" },
			{ "ac", mode = { "o", "x" }, desc = "Select comment block" },
		},
		dependencies = { "kana/vim-textobj-user" },
	}, -- vic, vac
	{
		"kiyoon/treesitter-indent-object.nvim",
		keys = {
			{
				"ai",
				"<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>",
				mode = { "x", "o" },
				desc = "Select context-aware indent (outer)",
			},
			{
				"aI",
				"<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>",
				mode = { "x", "o" },
				desc = "Select context-aware indent (outer, line-wise)",
			},
			{
				"ii",
				"<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>",
				mode = { "x", "o" },
				desc = "Select context-aware indent (inner, partial range)",
			},
			{
				"iI",
				"<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>",
				mode = { "x", "o" },
				desc = "Select context-aware indent (inner, entire range)",
			},
		},
	},
}
