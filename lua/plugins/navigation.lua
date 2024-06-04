local enable = require("config").enable

local oil = require("config.navigation.oil")
local tmux = require("config.navigation.tmux")
local rabbit = require("config.navigation.rabbit")
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
    "voxelprismatic/rabbit.nvim",
    enable = enable.rabbit,
    event = default_event,
    config = rabbit.config,
  },
}

return M
