return {
	"nvim-orgmode/orgmode",
	dependencies = { "nvim-lua/plenary.nvim" },
	build = { ":Neorg sync-parsers" },
	opts = {
		load = {
			["core.defaults"] = {},
		},
	},
}
