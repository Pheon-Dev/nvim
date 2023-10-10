local enable = require("config").enable

local move = require("config.utils.move")

local default_event = require("config.event").default

local M = {
  {
    "echasnovski/mini.pairs",
    enabled = enable.pairs,
    event = default_event,
    config = true,
  },
  {
    "echasnovski/mini.splitjoin",
    enabled = enable.splitjoin,
    event = default_event,
    config = true,
  },
  {
    "echasnovski/mini.move",
    enabled = enable.move,
    event = default_event,
    config = move.config,
  },
}

return M
