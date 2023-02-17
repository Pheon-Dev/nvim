return {
	"nvim-neorg/neorg",
	ft = "norg", -- lazy load on filetype
	build = ":Neorg sync-parsers",
	cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
	--  (you could also just remove both lazy loading things)
	priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							class = "~/.nb/home",
							home = "~/notes/home",
							work = "~/notes/wor",
						},
					},
				},
			},
		})
	end,
}
