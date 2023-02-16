return {
	"windwp/nvim-ts-autotag",
	{ "mrjones2014/nvim-ts-rainbow" },
	"junegunn/rainbow_parentheses.vim",
	-- references
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		-- event = "BufReadPost",
		config = function()
			require("illuminate").configure({ delay = 200 })
		end,
		keys = {
			{
				"]]",
				function()
					require("illuminate").goto_next_reference(false)
				end,
				desc = "Next Reference",
			},
			{
				"[[",
				function()
					require("illuminate").goto_prev_reference(false)
				end,
				desc = "Prev Reference",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		-- event = "BufReadPost",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				ensure_installed = {
					"bash",
					"go",
					"help",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"norg",
					"org",
					"python",
					"query",
					"regex",
					"rust",
					"tsx",
					"typescript",
					"vim",
					"yaml",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				autotag = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
				autopairs = { enable = true },
				indent = { enable = true },
				context_commentstring = { enable = true, enable_autocmd = false },
			})
		end,
	},
}
