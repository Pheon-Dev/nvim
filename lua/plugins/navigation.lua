local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    'abecodes/tabout.nvim',
    enabled = enable.tabout,
    event = default_event,
    config = require("config.tabout").config,
    wants = { 'nvim-treesitter' },
    after = { 'nvim-cmp' }
  },
  {
    "folke/which-key.nvim",
    enabled = enable.which_key,
    event = default_event,
    config = require("config.which-key").config,
  },
  {
    "Pheon-Dev/harpoon",
    enabled = enable.harpoon,
    config = require("config.harpoon").config,
  },
  {
    "Pheon-Dev/buffalo-nvim",
    enabled = enable.buffalo,
    event = default_event,
    config = require("config.buffalo").config,
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
    opts = require("config.flash").opts,
    keys = require("config.flash").keys,
    config = require("config.flash").config,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enable = enable.nvim_tree,
    event = default_event,
    cmd = require("config.nvim-tree").cmd,
    config = require("config.nvim-tree").config,
  },
}

return M
