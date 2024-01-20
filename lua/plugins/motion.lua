local enable = require("config").enable

local flash = require("config.motion.flash")
local eyeliner = require("config.motion.eyeliner")
local tshjkl = require("config.motion.tshjkl")

local default_event = require("config.event").default
local read_pre_event = require("config.event").read.pre
local lazy_event = require("config.event").lazy

local M = {
  {
    "kylechui/nvim-surround",
    event = default_event,
    enabled = enable.surround,
    config = true,
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
    "jinh0/eyeliner.nvim",
    event = read_pre_event,
    enabled = enable.eyeliner,
    config = eyeliner.config,
  },
  {
    "gsuuon/tshjkl.nvim",
    event = default_event,
    enabled = enable.tshjkl,
    config = tshjkl.config,
  },
  {
    "chaoren/vim-wordmotion",
    event = default_event,
    enabled = enable.wordmotion,
  },
}

return M
