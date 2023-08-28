return {
  "nvim-lua/plenary.nvim",
  {
    "junegunn/fzf",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    -- event = "VeryLazy",
  },
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    keys = {
      -- { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      -- { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
    enabled = true,
  },
  {
    "Pheon-Dev/harpoon",
    -- "ThePrimeagen/harpoon",
    enabled = true,
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
    "kylechui/nvim-surround",
    event = { "BufReadPost", "BufNewFile" },
    -- dependencies = { "roobert/surround-ui.nvim" },
    enabled = true,
    config = function()
      require("nvim-surround").setup({})
      -- require("surround-ui").setup({ root_key = "S" })
    end,
  },
  {
    "tpope/vim-repeat",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
  },
  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    -- event = "VeryLazy",
    enabled = true,
    config = function()
      require('nvim-highlight-colors').setup {}
    end,
  },
  {
    "lambdalisue/suda.vim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
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
    event = { "BufReadPost", "BufNewFile" },
    -- event = "VeryLazy",
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
    enabled = false,
    -- keys = { '<splitjoin>m', '<space>j', '<space>s' },
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

  {
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
    config = function()
      require("dressing").setup {
        input = {
          override = function(conf)
            conf.col = -1
            conf.row = 0
            return conf
          end,
        },
      }
    end
  },

  -- icons
  "nvim-tree/nvim-web-devicons",

  -- ui components
  "nvim-lua/popup.nvim",
}
