local enable = require("config").enable

local grapple = require("config.navigation.grapple")
local oil = require("config.navigation.oil")
local tfm = require("config.navigation.tfm")
local tmux = require("config.navigation.tmux")
local before = require("config.navigation.before")
local antelope = require("config.navigation.antelope")
local which_key = require("config.navigation.which-key")

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy
local vim_enter_event = require("config.event").enter.vim

local M = {
  {
    "folke/which-key.nvim",
    enabled = enable.which_key,
    event = default_event,
    config = which_key.config,
    init = which_key.init,
  },
  {
    "Pheon-Dev/antelope",
    enabled = enable.antelope,
    event = vim_enter_event,
    config = antelope.config,
  },
  {
    "stevearc/oil.nvim",
    enable = enable.oil,
    event = default_event,
    dependencies = oil.dependencies,
    config = oil.config,
  },
  {
    "numToStr/Navigator.nvim",
    enable = enable.tmux,
    event = lazy_event,
    config = tmux.config,
  },
  {
    "bloznelis/before.nvim",
    enable = enable.before,
    event = default_event,
    config = before.config,
  },
  {
    "rolv-apneseth/tfm.nvim",
    lazy = false,
    enable = enable.tfm,
    event = default_event,
    config = tfm.config,
  },
  {
    "cbochs/grapple.nvim",
    opts = grapple.opts,
    event = default_event,
    cmd = grapple.cmd,
    keys = grapple.keys,
  },
}

return M
