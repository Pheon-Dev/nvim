local enable = require("config").enable

local theme = require("config.utils.theme")
local dashboard = require("config.utils.dashboard")
local lualine = require("config.utils.lualine")
local cmp = require("config.utils.cmp")
local yanky = require("config.utils.yanky")
local dial = require("config.utils.dial")
local wilder = require("config.utils.wilder")

local default_event = require("config.event").default
local vim_enter_event = require("config.event").enter.vim
local cmd_enter_event = require("config.event").enter.cmd
local insert_enter_event = require("config.event").enter.insert

local M = {
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
    'glepnir/dashboard-nvim',
    enabled = enable.dashboard,
    event = vim_enter_event,
    config = dashboard.config,
    dependencies = dashboard.dependencies,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = enable.lualine,
    event = default_event,
    config = lualine.config
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = enable.cmp,
    event = insert_enter_event,
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
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = enable.codeium,
  },
  {
    'willothy/wezterm.nvim',
    event = default_event,
    enabled = enable.wezterm,
    config = true
  },
  {
    'gelguy/wilder.nvim',
    event = cmd_enter_event,
    enabled = enable.wilder,
    dependencies = wilder.dependencies,
    config = wilder.config,
    build = ":UpdateRemotePlugins",
  },
}

return M
