return {

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		-- version = "<CurrentMajor>.*",
		-- install jsregexp (optional!).
		-- build = "make install_jsregexp",
		-- config = {
		-- 	history = true,
		-- 	delete_check_events = "TextChanged",
		-- },
		-- init = function()
		-- 	local function jump(key, dir)
		-- 		vim.keymap.set({ "i", "s" }, key, function()
		-- 			return require("luasnip").jump(dir) or key
		-- 		end, { expr = true })
		-- 	end
		-- 	jump("<tab>", 1)
		-- 	jump("<s-tab>", -1)
		-- end,
	},

	{
		"xiyaowong/virtcolumn.nvim",
		event = "BufReadPre",
	},
	{
		"utilyre/sentiment.nvim",
		event = "BufReadPre",
		config = function()
			require("sentiment").setup({})
		end,
	},

	{ "JoosepAlviste/nvim-ts-context-commentstring" },
}
