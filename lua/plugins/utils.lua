local enable = require("config").enable

local theme = require("config.utils.theme")
local persistence = require("config.utils.persistence")
local lualine = require("config.utils.lualine")
local cmp = require("config.utils.cmp")
local yanky = require("config.utils.yanky")
local dial = require("config.utils.dial")
local muren = require("config.utils.muren")
local fold = require("config.utils.fold")
local bookmarks = require("config.utils.bookmarks")

local default_event = require("config.event").default
local vim_enter_event = require("config.event").enter.vim
local cmd_enter_event = require("config.event").enter.cmd

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
    "gbprod/yanky.nvim",
    enabled = enable.yanky,
    event = default_event,
    opts = yanky.opts,
    keys = yanky.keys,
    config = yanky.config,
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
}

return M
