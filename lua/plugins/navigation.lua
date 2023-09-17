local enable = require("config").enable

local buffalo = require("config.navigation.buffalo")
local flash = require("config.navigation.flash")
local harpoon = require("config.navigation.harpoon")
local tabout = require("config.navigation.tabout")
local nvim_tree = require("config.navigation.nvim-tree")
local which_key = require("config.navigation.which-key")

local default_event = require("config.event").default

local M = {
  {
    'abecodes/tabout.nvim',
    enabled = enable.tabout,
    event = default_event,
    config = tabout.config,
    wants = { 'nvim-treesitter' },
    after = { 'nvim-cmp' }
  },
  {
    "folke/which-key.nvim",
    enabled = enable.which_key,
    event = default_event,
    config = which_key.config,
  },
  {
    "Pheon-Dev/harpoon",
    enabled = enable.harpoon,
    config = harpoon.config,
  },
  {
    "Pheon-Dev/buffalo-nvim",
    enabled = enable.buffalo,
    event = default_event,
    config = buffalo.config,
  },
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
    "nvim-tree/nvim-tree.lua",
    enable = enable.nvim_tree,
    event = default_event,
    cmd = nvim_tree.cmd,
    config = nvim_tree.config,
  },
}

return M
