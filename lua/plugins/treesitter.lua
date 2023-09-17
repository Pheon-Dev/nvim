local enable = require("config").enable

local treesitter = require("config.treesitter")

local default_event = require("config.event").default
local insert_enter_event = require("config.event").enter.insert
local cmd_enter_event = require("config.event").enter.cmd

local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = enable.treesitter,
    event = default_event,
    build = treesitter.treesitter_build,
    dependencies = treesitter.treesitter_dependencies,
    config = treesitter.treesitter_config,
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { insert_enter_event, cmd_enter_event },
    branch = treesitter.autopair_branch,
    config = treesitter.autopair_config,
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = enable.autotag,
    event = default_event,
    config = treesitter.autotag_config,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = enable.context,
    event = default_event,
    config = treesitter.treesitter_context_config,
  },
  {
    "RRethy/vim-illuminate",
    enabled = enable.illuminate,
    event = default_event,
    config = treesitter.illuminate_config,
    keys = treesitter.illuminate_keys,
  },
}

return M
