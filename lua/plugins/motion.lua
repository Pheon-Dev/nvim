local enable = require("config").enable

local flash = require("config.motion.flash")

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy

local M = {
  {
    "kylechui/nvim-surround",
    event = default_event,
    enabled = enable.surround,
    config = true,
  },
  {
    "chaoren/vim-wordmotion",
    event = default_event,
    enabled = enable.word_motion,
  },
  {
    "folke/flash.nvim",
    event = default_event,
    enabled = enable.flash,
    opts = flash.opts,
    keys = flash.keys,
    config = flash.config,
  },
}

return M
