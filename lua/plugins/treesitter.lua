local enable = require("config").enable

local default_event = require("config.event").default
local insert_enter_event = require("config.event").enter.insert
local cmd_enter_event = require("config.event").enter.cmd

local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = enable.treesitter,
    event = default_event,
    build = require("config.treesitter").treesitter_build,
    dependencies = require("config.treesitter").treesitter_dependencies,
    config = require("config.treesitter").treesitter_config,
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { insert_enter_event, cmd_enter_event },
    branch = require("config.treesitter").autopair_branch,
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = enable.autotag,
    event = default_event,
    config = require("config.treesitter").autotag_config,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = enable.context,
    event = default_event,
    config = require("config.treesitter").treesitter_context_config,
  },
  {
    "RRethy/vim-illuminate",
    enabled = enable.illuminate,
    event = default_event,
    config = require("config.treesitter").illuminate_config,
    keys = require("config.treesitter").illuminate_keys,
  },
}

return M
