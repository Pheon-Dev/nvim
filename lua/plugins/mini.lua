local enable = require("config").enable

local move = require("config.utils.move")
local indentscope = require("config.utils.indentscope")
local bracketed = require("config.utils.bracketed")

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
  {
    "echasnovski/mini.indentscope",
    enabled = enable.indentscope,
    event = default_event,
    config = indentscope.config,
  },
  {
    "echasnovski/mini.bracketed",
    enabled = enable.bracketed,
    event = default_event,
    config = bracketed.config,
  },
}

return M
