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
      -- { "gk", "<cmd>TSJSplit<CR>", desc = "Treesitter Split" },
      -- { "gj", "<cmd>TSJJoin<CR>", desc = "Treesitter Join" },
      { "gj", "<cmd>TSJToggle<CR>", desc = "Treesitter Toggle" },
    },
    config = function()
      local tsj = require('treesj')

      local langs = { --[[ configuration for languages ]] }

      tsj.setup({
        -- Use default keymaps
        -- (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = false,

        -- Node with syntax error will not be formatted
        check_syntax_error = true,

        -- If line after join will be longer than max value,
        -- node will not be formatted
        max_join_length = 120,

        -- hold|start|end:
        -- hold - cursor follows the node/place on which it was called
        -- start - cursor jumps to the first symbol of the node being formatted
        -- end - cursor jumps to the last symbol of the node being formatted
        cursor_behavior = 'hold',

        -- Notify about possible problems or not
        notify = true,
        langs = langs,

        -- Use `dot` for repeat action
        dot_repeat = true,
      })
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
