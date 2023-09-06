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
    config = function()
      local opts = { noremap = true }
      local map = vim.keymap.set
      -- Setup
      -- Navigate buffers bypassing the menu
      local harpoon = require("harpoon.ui")
      local keys = 'hjklasdfgn'
      for i = 1, #keys do
        local key = keys:sub(i, i)
        map(
          'n',
          string.format('<C-%s>', key),
          function() harpoon.nav_file(i) end,
          opts
        )
      end
      -- Just the menu
      -- map({ 't', 'n' }, '<S-Space>', harpoon.toggle_quick_menu, opts)
      -- -- Open menu and search
      -- map({ 't', 'n' }, '<C-M>', function()
      --   harpoon.toggle_quick_menu()
      --   -- wait for the menu to open
      --   vim.defer_fn(function()
      --     vim.fn.feedkeys('/')
      --   end, 50)
      -- end, opts)
      -- Next/Prev
      -- map('n', '<M-l>', harpoon.nav_next, opts)
      -- map('n', '<M-h>', harpoon.nav_prev, opts)
    end
  },
  {
    "Pheon-Dev/buffalo-nvim",
    enabled = true,
    -- event = { "BufReadPost", "BufNewFile" },
    config = function()
      local opts = { noremap = true }
      local map = vim.keymap.set
      -- Setup
      require("buffalo").setup({
        tab_commands = {
          select = {
            key = "l",
            command = "tabnext"
          },
          accept = {
            key = "<CR>",
            command = "tabnext"
          },
          close = {
            key = "x",
            command = "tabclose"
          },
          new = {
            key = "n",
            command = "tabnew"
          }
        },
        buffer_commands = {
          enter = {
            key = "<CR>",
            command = "edit"
          },
          edit = {
            key = "l",
            command = "edit"
          },
          vsplit = {
            key = "v",
            command = "vsplit"
          },
          split = {
            key = "b",
            command = "split"
          }
        },
        general_commands = {
          cycle = false,
          exit_menu = "h",
        },
        go_to = {
          enabled = true,
          go_to_tab = "<leader>%s",
          go_to_buffer = "<M-%s>",
        },
        filter = {
          enabled = true,
          filter_tabs = "<M-t>",
          filter_buffers = "<M-b>",
        },
        ui = {
          width = 60,
          height = 10,
          row = 2,
          col = 2,
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        }
      })

      local buffalo = require("buffalo.ui")

      map({ 't', 'n' }, '<M-Space>', buffalo.toggle_buf_menu, opts)
      map({ 't', 'n' }, '<C-Space>', buffalo.toggle_tab_menu, opts)

      map('n', '<C-j>', buffalo.nav_buf_next, opts)
      map('n', '<C-k>', buffalo.nav_buf_prev, opts)
      map('n', '<C-n>', buffalo.nav_tab_next, opts)
      map('n', '<C-p>', buffalo.nav_tab_prev, opts)
    end
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
    "chaoren/vim-wordmotion",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
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
