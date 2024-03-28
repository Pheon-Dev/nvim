local enable = require("config").enable

local git = require("config.git")

local default_event = require("config.event").default

local M = {
  {
    "lewis6991/gitsigns.nvim",
    enabled = enable.git_signs,
    event = default_event,
    keys = git.keys,
    config = git.config,
  },
}

return M
