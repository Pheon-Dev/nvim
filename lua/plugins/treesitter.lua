local enable = require("config").enable

local treesitter = require("config.treesitter.treesitter")
local context = require("config.treesitter.context")
local autopair = require("config.treesitter.autopair")
local autotag = require("config.treesitter.autotag")
local illuminate = require("config.treesitter.illuminate")

local default_event = require("config.event").default
local insert_enter_event = require("config.event").enter.insert
local cmd_enter_event = require("config.event").enter.cmd

local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = enable.treesitter,
    event = default_event,
    build = treesitter.build,
    dependencies = treesitter.dependencies,
    config = treesitter.config,
  },
  {
    'altermo/ultimate-autopair.nvim',
    event = { insert_enter_event, cmd_enter_event },
    branch = autopair.branch,
    config = autopair.config,
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = enable.autotag,
    event = default_event,
    config = autotag.config,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = enable.context,
    event = default_event,
    keys = context.keys,
    config = context.config,
  },
  {
    "RRethy/vim-illuminate",
    enabled = enable.illuminate,
    event = default_event,
    config = illuminate.config,
    keys = illuminate.keys,
  },
}

return M
