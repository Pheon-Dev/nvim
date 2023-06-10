return {
	{
		"chrisgrieser/nvim-various-textobjs",
		event = "BufReadPre",
		opts = { useDefaultKeymaps = true },
		config = function()
			local map = vim.api.nvim_set_keymap

			map("n", "viB", "vi{", { noremap = true, silent = true })
			map("n", "vaB", "va{", { noremap = true, silent = true })
			map("n", "yiB", "yi{", { noremap = true, silent = true })
			map("n", "yaB", "ya{", { noremap = true, silent = true })
			map("n", "ciB", "ci{", { noremap = true, silent = true })
			map("n", "caB", "ca{", { noremap = true, silent = true })
			map("n", "diB", "di{", { noremap = true, silent = true })
			map("n", "daB", "da{", { noremap = true, silent = true })

			require("various-textobjs").setup({
				lookForwardSmall = 5,
				lookForwardBig = 15,
				useDefaultKeymaps = true,
				-- disabledKeymaps = { "ai", "ii", "aI", "iI" },
			})
		end,
	},
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
	},
}
