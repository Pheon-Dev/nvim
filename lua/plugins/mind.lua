return {
	"phaazon/mind.nvim",
	branch = "v2.2",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("mind").setup()
	end,
}
