local enable = require("config").enable

local flash = require("config.motion.flash")
local eyeliner = require("config.motion.eyeliner")

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
  {
    'jinh0/eyeliner.nvim',
    event = default_event,
    enabled = enable.eyeliner,
    config = eyeliner.config,
  }
}

return M
