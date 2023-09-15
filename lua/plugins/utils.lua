return {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/popup.nvim",
  {
    "stevearc/dressing.nvim",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
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
    "folke/neodev.nvim",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      debug = true,
      experimental = {
        pathStrict = true,
      },
    },
  },
  -- Lua
  {
    'abecodes/tabout.nvim',
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require('tabout').setup {
        tabkey = '<C-n>',            -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<C-p>',  -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true,           -- shift content if tab out is not possible
        act_as_shift_tab = false,    -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>',       -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true,     -- well ...
        completion = true,           -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    wants = { 'nvim-treesitter' }, -- or require if not used so far
    after = { 'nvim-cmp' }         -- if a completion plugin is using tabs load it before
  },
  {
    "lukas-reineke/virt-column.nvim",
    dependencies = {
      "m4xshen/smartcolumn.nvim",
    },
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
      require('virt-column').setup({
        char = '┊',
      })
      require('smartcolumn').setup()
      vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved", "CursorMovedI", "WinScrolled" }, {
        callback = function()
          vim.cmd("VirtColumnRefresh")
        end
      })
    end,
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {}
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
      -- map({ 't', 'n' }, '<leader>k', harpoon.toggle_quick_menu, opts)
      -- vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("harpoon.ui").nav_file(vim.v.count1)<cr>',
      --   { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>lua require("harpoon.ui").nav_next()<cr>',
      --   { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>lua require("harpoon.ui").nav_prev()<cr>',
      --   { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua require("harpoon.mark").add_file()<cr>',
      --   { noremap = true, silent = true })

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
    event = { "BufReadPost", "BufNewFile" },
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
          },
          only = {
            key = "o",
            command = "tabonly"
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
          cycle = true,
          exit_menu = "h",
        },
        go_to = {
          enabled = false,
          go_to_tab = "<leader>%s",
          go_to_buffer = "<M-%s>",
        },
        filter = {
          enabled = false,
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

      map({ 't', 'n' }, '<leader>b', buffalo.toggle_buf_menu, opts)
      -- map({ 't', 'n' }, '<M-Space>', buffalo.toggle_buf_menu, opts)
      -- map({ 't', 'n' }, '<C-Space>', buffalo.toggle_tab_menu, opts)

      -- map('n', '<C-j>', buffalo.nav_buf_next, opts)
      map('n', '<C-k>', buffalo.nav_buf_prev, opts)
      map('n', '<C-n>', buffalo.nav_tab_next, opts)
      -- map('n', '<C-p>', buffalo.nav_tab_prev, opts)
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
}
