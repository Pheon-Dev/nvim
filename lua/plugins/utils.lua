return {
  "nvim-lua/plenary.nvim",
  {
    "junegunn/fzf",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    -- event = "VeryLazy",
  },
  {
    "chaoren/vim-wordmotion",
    event = { "BufReadPost", "BufNewFile" },
  },
  -- {
  --   'kevinhwang91/nvim-fundo',
  --   dependencies = 'kevinhwang91/promise-async',
  --   run = function()
  --     require('fundo').install()
  --   end,
  --   config = function()
  --     require('fundo').setup()
  --   end
  -- },
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
    dependencies = { "roobert/surround-ui.nvim" },
    enabled = true,
    config = function()
      require("nvim-surround").setup({})
      require("surround-ui").setup({ root_key = "S" })
    end,
  },
  {
    "tpope/vim-repeat",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
  },
  -- {
  --   "svermeulen/vim-easyclip",
  --   event = { "BufReadPost", "BufNewFile" },
  --   enabled = false,
  -- },
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
      require("virt-column").setup({
        char = "┊",
        virtcolumn = "80",
      })
    end
  },
  {
    'tomiis4/BufferTabs.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    lazy = false,
    enabled = false,
    config = function()
      require('buffertabs').setup({
        ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
        border = 'rounded',

        ---@type boolean
        icons = true,

        ---@type string
        hl_group = 'Keyword',

        ---@type string
        hl_group_inactive = 'Comment',

        ---@type table[]
        exclude = {},

        ---@type boolean
        show_all = false,

        ---@type 'row'|'column'
        display = 'column',

        ---@type 'left'|'right'|'center'
        horizontal = 'right',

        ---@type 'top'|'bottom'|'center'
        vertical = 'bottom',
      })
    end
  },
  -- {
  --   "max397574/better-escape.nvim",
  --   event = { "BufReadPost", "BufNewFile" },
  --   enabled = true,
  --   config = function()
  --     require("better_escape").setup {
  --       mapping = { "jj" },         -- a table with mappings to use
  --       timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
  --       clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
  --       keys = "<Esc>",             -- keys used for escaping, if it is a function will use the result everytime
  --       -- example(recommended)
  --       -- keys = function()
  --       --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
  --       -- end,
  --     }
  --   end,
  -- },
  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
  },
  -- {
  --   "smoka7/multicursors.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'smoka7/hydra.nvim',
  --   },
  --   opts = {},
  --   cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  --   keys = {
  --     {
  --       mode = { 'v', 'n' },
  --       '<C-n>',
  --       '<cmd>MCstart<cr>',
  --       desc = 'Create a selection for selected text or word under the cursor',
  --     },
  --   },
  -- },
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
