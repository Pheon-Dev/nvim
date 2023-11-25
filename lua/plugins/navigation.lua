local enable = require("config").enable

local buffalo = require("config.navigation.buffalo")
local oil = require("config.navigation.oil")
local harpoon = require("config.navigation.harpoon")
local antelope = require("config.navigation.antelope")
local nvim_tree = require("config.navigation.nvim-tree")
local which_key = require("config.navigation.which-key")

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy

local M = {
  {
    "folke/which-key.nvim",
    enabled = enable.which_key,
    event = lazy_event,
    -- event = default_event,
    config = which_key.config,
  },
  {
    "ThePrimeagen/harpoon",
    enabled = enable.harpoon,
    -- event = lazy_event,
    config = harpoon.config,
  },
  {
    "Pheon-Dev/antelope",
    enabled = enable.antelope,
    event = default_event,
    config = antelope.config,
  },
  {
    "Pheon-Dev/buffalo-nvim",
    enabled = enable.buffalo,
    event = default_event,
    config = buffalo.config,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enable = enable.nvim_tree,
    event = default_event,
    cmd = nvim_tree.cmd,
    config = nvim_tree.config,
  },
  {
    'stevearc/oil.nvim',
    enable = enable.oil,
    event = lazy_event,
    -- event = default_event,
    dependencies = oil.dependencies,
    config = oil.config,
  },
}

return M
