local enable = require("config").enable

local theme = require("config.utils.theme")
local persistence = require("config.utils.persistence")
local lualine = require("config.utils.lualine")
local cmp = require("config.utils.cmp")
local dial = require("config.utils.dial")
local muren = require("config.utils.muren")
local fold = require("config.utils.fold")
local bookmarks = require("config.utils.bookmarks")

local default_event = require("config.event").default
local vim_enter_event = require("config.event").enter.vim

local M = {
  {
    "nvim-lua/plenary.nvim",
    enabled = enable.plenary,
  },
  {
    "nvim-lua/popup.nvim",
    enabled = enable.popup,
  },
  {
    "voldikss/vim-floaterm",
    event = vim_enter_event,
    enabled = enable.floaterm,
  },
  {
    "lambdalisue/suda.vim",
    event = default_event,
    enabled = enable.suda,
  },
  {
    "MattesGroeger/vim-bookmarks",
    event = default_event,
    enabled = enable.bookmarks,
    config = bookmarks.config,
  },
  {
    "nvim-tree/nvim-web-devicons",
    enabled = enable.dev_icons,
  },
  {
    "catppuccin/nvim",
    name = theme.name,
    lazy = theme.lazy,
    enabled = enable.theme,
    priority = theme.priority,
    config = theme.config,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = enable.lualine,
    event = default_event,
    config = lualine.config,
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = enable.cmp,
    event = {
      -- insert_enter_event,
      -- cmd_enter_event,
      default_event,
    },
    dependencies = cmp.dependencies,
    config = cmp.config,
  },
  {
    "monaqa/dial.nvim",
    event = default_event,
    enabled = enable.dial,
    keys = dial.keys,
    config = dial.config,
  },
  {
    "tenxsoydev/karen-yank.nvim",
    enabled = enable.yank,
    event = default_event,
    config = true,
  },
  {
    "tpope/vim-repeat",
    event = default_event,
    enabled = enable.vim_repeat,
  },
  {
    "AckslD/muren.nvim",
    enabled = enable.muren,
    event = default_event,
    config = muren.config,
  },
  {
    "kevinhwang91/nvim-ufo",
    enabled = enable.fold,
    event = default_event,
    dependencies = fold.dependencies,
    keys = fold.keys,
    config = fold.config,
  },
  {
    "folke/persistence.nvim",
    enabled = enable.persistence,
    event = default_event,
    opts = persistence.opts,
  },
  {
    "Wansmer/sibling-swap.nvim",
    requires = { "nvim-treesitter" },
    event = default_event,
    config = function()
      local config = {
        allowed_separators = {
          ",",
          ";",
          "and",
          "or",
          "&&",
          "&",
          "||",
          "|",
          "==",
          "===",
          "!=",
          "!==",
          "-",
          "+",
          ["<"] = ">",
          ["<="] = ">=",
          [">"] = "<",
          [">="] = "<=",
        },
        use_default_keymaps = true,
        -- Highlight recently swapped node. Can be boolean or table
        -- If table: { ms = 500, hl_opts = { link = 'IncSearch' } }
        -- `hl_opts` is a `val` from `nvim_set_hl()`
        highlight_node_at_cursor = false,
        -- keybinding for movements to right or left (and up or down, if `allow_interline_swaps` is true)
        -- (`<C-,>` and `<C-.>` may not map to control chars at system level, so are sent by certain terminals as just `,` and `.`. In this case, just add the mappings you want.)
        keymaps = {
          ["<C-.>"] = "swap_with_right",
          ["<C-,>"] = "swap_with_left",
          ["<space>."] = "swap_with_right_with_opp",
          ["<space>,"] = "swap_with_left_with_opp",
        },
        ignore_injected_langs = false,
        -- allow swaps across lines
        allow_interline_swaps = true,
        -- swaps interline siblings without separators (no recommended, helpful for swaps html-like attributes)
        interline_swaps_without_separator = false,
        -- Fallbacs for tiny settings for langs and nodes. See #fallback
        fallback = {},
      }
      require("sibling-swap").setup({ config })
    end,
  },
}

return M
