return {
	"lewis6991/impatient.nvim",
	"nathom/filetype.nvim",
	{
		"imsnif/kdl.vim",
		event = "VeryLazy",
	},

	-- measure startuptime
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- persistence
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = true,
	},
	"nvim-lua/plenary.nvim",

	"Pheon-Dev/harpoon",
	-- "ThePrimeagen/harpoon",
	{
		"booperlv/nvim-gomove",
		event = "BufReadPre",
		config = function()
			require("gomove").setup({
				-- whether or not to map default key bindings, (true/false)
				map_defaults = false,
				-- whether or not to reindent lines moved vertically (true/false)
				reindent = true,
				-- whether or not to undojoin same direction moves (true/false)
				undojoin = true,
				-- whether to not to move past end column when moving blocks horizontally, (true/false)
				move_past_end_col = false,
			})
		end,
	},
	{ "kevinhwang91/nvim-hlslens", config = true },

	{ "ckipp01/stylua-nvim" },

  {
    "Wansmer/treesj",
    keys = {
      { "gk", "<cmd>TSJSplit<CR>", desc = "Treesitter Split" },
      { "gj", "<cmd>TSJJoin<CR>", desc = "Treesitter Join" },
      -- { "<space>g", "<cmd>TSJToggle<CR>", desc = "Treesitter Toggle" },
    },
    config = function()
      require("treesj").setup { use_default_keymaps = false }
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
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
  {
    "mg979/vim-visual-multi",
    event = "BufReadPre",
    config = function()
      -- require("sentiment").setup({})
    end,
  },
}
