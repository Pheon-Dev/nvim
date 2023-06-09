return {
	{
		"mfussenegger/nvim-treehopper",
		dependencies = {
			{
				"phaazon/hop.nvim",
				config = function()
					require("hop").setup()
				end,
			},
		},
		keys = {
			{
				"m",
				"<Cmd>lua require('tsht').nodes()<CR>",
				mode = "o",
				desc = "TreeSitter [M]otion",
			},
			{
				"m",
				":lua require('tsht').nodes()<CR>",
				mode = "x",
				noremap = true,
				desc = "TreeSitter [M]otion",
			},
			{ "m", "<Cmd>lua require('tsht').move({ side = 'start' })<CR>", desc = "TreeSitter [M]otion" },
			{
				"M",
				"m",
				noremap = true,
				desc = "[M]ark",
			},
		},
	},
	{
		"ggandor/leap.nvim",
    event = "BufReadPre",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		dependencies = {
			"tpope/vim-repeat",
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings()
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")

			-- x to delete without yanking
			vim.keymap.set({ "n", "x" }, "x", [["_x]], { noremap = true })
		end,
	},
	{
		"ggandor/flit.nvim",
		keys = function()
			---@type LazyKeys[]
			local ret = {}
			for _, key in ipairs({ "f", "F", "t", "T" }) do
				ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
			end
			return ret
		end,
		opts = { labeled_modes = "nv" },
    event = "BufReadPre",
	},
	{
		"chaoren/vim-wordmotion",
		event = "VeryLazy",
		-- use init instead of config to set variables before loading the plugin
		-- init = function()
		-- 	vim.g.wordmotion_prefix = "<space>"
		-- end,
	},
}
