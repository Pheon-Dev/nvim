local enable = require("config").enable

local default_event = require("config.event").default
local vim_enter_event = require("config.event").enter.vim

local M = {
  {
    "nvim-tree/nvim-web-devicons",
    enabled = enable.dev_icons,
  },
  {
    "catppuccin/nvim",
    name = require("config.theme").name,
    lazy = require("config.theme").lazy,
    enabled = enable.theme,
    priority = require("config.theme").priority,
    config = require("config.theme").config,
  },
  {
    'glepnir/dashboard-nvim',
    enabled = enable.dashboard,
    event = vim_enter_event,
    config = require("config.dashboard").config,
    dependencies = require("config.dashboard").dependencies,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = enable.lualine,
    event = default_event,
    config = require("config.lualine").config
  },
  {
    "monaqa/dial.nvim",
    event = default_event,
    enabled = enable.dial,
    keys = require("config.dial").keys,
    config = require("config.dial").config,
  },
  {
    'declancm/cinnamon.nvim',
    event = default_event,
    enabled = enable.scroll,
    config = require("config.scroll").config,
  },
  {
    "gbprod/yanky.nvim",
    enabled = enable.yanky,
    event = default_event,
    opts = require("config.yanky").opts,
    keys = require("config.yanky").keys,
    config = require("config.yanky").config,
  },
  {
    "tpope/vim-repeat",
    event = default_event,
    enabled = enable.vim_repeat,
  },
  {
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = enable.codeium,
  },
}

return M
