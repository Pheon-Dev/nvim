return {
	{
		"chrisgrieser/nvim-various-textobjs",
		event = "BufReadPre",
		opts = { useDefaultKeymaps = true },
		config = function()
			-- default config
			require("various-textobjs").setup({
				-- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
				-- set to 0 to only look in the current line
				lookForwardSmall = 5,

				-- lines to seek forwards for "big" textobjs (linewise textobjs & url textobj)
				lookForwardBig = 15,

				-- use suggested keymaps (see README)
				useDefaultKeymaps = false,

				-- disable some default keymaps, e.g. { "ai", "ii" }
				disabledKeymaps = {},
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
