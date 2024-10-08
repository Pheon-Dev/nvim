local enable = require("config").enable

local oil = require("config.navigation.oil")
local tfm = require("config.navigation.tfm")
local navigator = require("config.navigation.navigator")
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
    -- init = which_key.init,
    config = which_key.config,
    keys = which_key.keys,
    -- opts = which_key.opts,
  },
  {
    "Pheon-Dev/antelope",
    enabled = enable.antelope,
    -- event = vim_enter_event,
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
    enable = enable.navigator,
    event = lazy_event,
    config = navigator.config,
  },
  {
    "bloznelis/before.nvim",
    enable = enable.before,
    event = default_event,
    config = before.config,
  },
  {
    "rolv-apneseth/tfm.nvim",
    enable = enable.tfm,
    event = default_event,
    config = tfm.config,
  },
}

return M
