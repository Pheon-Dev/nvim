local enable = require("config").enable

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
    config = require("config.move").config,
  },
}

return M
