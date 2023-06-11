return {
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup({ keys = "asdfghjklmnpqrstuv" })
		end,
	},
	{
		"chaoren/vim-wordmotion",
		event = "BufReadPre",
	},
}
