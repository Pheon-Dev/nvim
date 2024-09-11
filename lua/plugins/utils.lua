local enable = require("config").enable

local barline = require("config.utils.barline")
local multi = require("config.utils.multi")
local caps = require("config.utils.caps")
local rip = require("config.utils.rip")
local theme = require("config.utils.theme")
local persistence = require("config.utils.persistence")
local lualine = require("config.utils.lualine")
local cmp = require("config.utils.cmp")
local dial = require("config.utils.dial")
local muren = require("config.utils.muren")
local fold = require("config.utils.fold")
local satellite = require("config.utils.satellite")
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
    "chrisgrieser/nvim-rip-substitute",
    cmd = rip.cmd,
    enable = enable.rip,
    keys = rip.keys,
    config = rip.config,
  },
  {
    "dmtrKovalenko/caps-word.nvim",
    -- lazy = true,
    enabled = enable.caps,
    event = default_event,
    keys = caps.keys,
    opts = caps.opts,
  },
  {
    "jake-stewart/multicursor.nvim",
    enabled = enable.multi,
    event = default_event,
    config = multi.config,
  },
  {
    "OXY2DEV/bars-N-lines.nvim",
    event = default_event,
    enabled = enable.barline,
    -- opts = barline.opts,
  },
  {
    "lewis6991/satellite.nvim",
    enabled = enable.satellite,
    event = default_event,
    config = satellite.config,
  },
  --[[ {
    "OXY2DEV/foldtext.nvim",
    enabled = enable.fold,
    event = default_event,
  }, ]]
}

return M
