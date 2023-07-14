return {
  "nvim-lua/plenary.nvim",
  {
    "booperlv/nvim-gomove",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
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
  {
    "junegunn/fzf",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    -- event = "VeryLazy",
  },
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
    enabled = true,
  },
  {
    "Pheon-Dev/harpoon",
    -- "ThePrimeagen/harpoon",
  },
  {
    "utilyre/sentiment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
      require("sentiment").setup({})
    end,
  },
  {
    "tpope/vim-surround",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
  },
  {
    "tpope/vim-repeat",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
  },
  {
    "svermeulen/vim-easyclip",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
    end,
  },
  {
    "rcarriga/nvim-notify",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        background_colour = "Normal",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 2,
        -- minimum_width = 50,
        render = "minimal", -- compact, minimal, simple, default
        stages = "slide",
        top_down = true,
        timeout = 3000,
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.35)
        end,
      })
    end,
  },

  {
    'Wansmer/treesj',
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    -- keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
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

  -- better vim.ui
  -- {
  -- "stevearc/dressing.nvim",
  -- init = function()
  --   ---@diagnostic disable-next-line: duplicate-set-field
  --   vim.ui.select = function(...)
  --     require("lazy").load({ plugins = { "dressing.nvim" } })
  --     return vim.ui.select(...)
  --   end
  --   ---@diagnostic disable-next-line: duplicate-set-field
  --   vim.ui.input = function(...)
  --     require("lazy").load({ plugins = { "dressing.nvim" } })
  --     return vim.ui.input(...)
  --   end
  -- end,
  -- config = function()
  --   require("dressing").setup {
  --     input = {
  --       override = function(conf)
  --         conf.col = -1
  --         conf.row = 0
  --         return conf
  --       end,
  --     },
  --   }
  -- end
  -- },

  -- icons
  "nvim-tree/nvim-web-devicons",

  -- ui components
  "nvim-lua/popup.nvim",
}
