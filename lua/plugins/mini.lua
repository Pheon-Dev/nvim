return {
	-- {
	-- 	"echasnovski/mini.ai",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("mini.ai").setup({})
	-- 	end,
	-- },
  -- {
  --   "Wansmer/treesj",
  --   keys = {
  --     { "<space>l", "<cmd>TSJSplit<CR>", desc = "Treesitter Split" },
  --     { "<space>h", "<cmd>TSJJoin<CR>", desc = "Treesitter Join" },
  --     -- { "<space>g", "<cmd>TSJToggle<CR>", desc = "Treesitter Toggle" },
  --   },
  --   config = function()
  --     require("treesj").setup { use_default_keymaps = false }
  --   end,
  -- },
	{
		"echasnovski/mini.splitjoin",
		event = "VeryLazy",
		config = function()
			require("mini.splitjoin").setup({})
		end,
	},

	--[[ {
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = function()
			require("mini.pairs").setup({})
		end,
	}, ]]

  {
    -- Similar to tpope/vim-surround
    -- dsf to delete surrounding function call.
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
	-- {
	-- 	"echasnovski/mini.surround",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("mini.surround").setup({})
	-- 	end,
	-- },
}
