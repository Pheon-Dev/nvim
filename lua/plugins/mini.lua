return {
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup({})
		end,
	},

	{
		"echasnovski/mini.splitjoin",
		event = "VeryLazy",
		config = function()
			require("mini.splitjoin").setup({})
		end,
	},

	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup({})
		end,
	},

	-- {
	-- 	"echasnovski/mini.surround",
	-- 	event = "VeryLazy",
	-- 	-- keys = { "gz" },
	-- 	config = function()
	-- 		-- use gz mappings instead of s to prevent conflict with leap
	-- 		require("mini.surround").setup({
	-- 			-- mappings = {
	-- 			-- 	add = "gza", -- Add surrounding in Normal and Visual modes
	-- 			-- 	delete = "gzd", -- Delete surrounding
	-- 			-- 	find = "gzf", -- Find surrounding (to the right)
	-- 			-- 	find_left = "gzF", -- Find surrounding (to the left)
	-- 			-- 	highlight = "gzh", -- Highlight surrounding
	-- 			-- 	replace = "gzr", -- Replace surrounding
	-- 			-- 	update_n_lines = "gzn", -- Update `n_lines`
	-- 			-- },
	-- 		})
	-- 	end,
	-- },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function()
			require("mini.comment").setup({
				hooks = {
					pre = function()
						require("ts_context_commentstring.internal").update_commentstring({})
					end,
				},
			})
		end,
	},
}
