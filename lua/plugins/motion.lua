return {
	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings()
			leap.setup({
				max_phase_one_targets = nil,
				highlight_unlabeled_phase_one_targets = false,
				max_highlighted_traversal_targets = 10,
				case_sensitive = false,
				equivalence_classes = { " \t\r\n" },
				substitute_chars = {},
				safe_labels = { "a", "s", "d", "f", "g", "h", "j", "k", "l", "q", "w", "e", "r", "t", "y", "p", "u", "i", "o", "m", "n", "b", "v", "c", "x", "y", "z" },
				-- labels = { "a", "s", "d", "f", "g", "h", "j", "k", "l" },
				-- labels = { "s", "f", "n", "j", "k" },
				special_keys = {
					repeat_search = "<enter>",
					next_phase_one_target = "<enter>",
					next_target = { "<enter>", ";" },
					prev_target = { "<tab>", "," },
					next_group = "<space>",
					prev_group = "<tab>",
					multi_accept = "<enter>",
					multi_revert = "<backspace>",
				},
			})
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
		event = "BufReadPre",
	},
}
