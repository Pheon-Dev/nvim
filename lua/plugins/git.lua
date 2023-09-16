local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "lewis6991/gitsigns.nvim",
    enabled = enable.git_signs,
    event = default_event,
    keys = require("config.git").keys,
    config = require("config.git").config,
  },
  {
    "f-person/git-blame.nvim",
    enabled = enable.git_blame,
    event = default_event,
  },
}

return M
