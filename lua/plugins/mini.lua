local enable = require("config").enable

local icons = require("config.utils.icons")
local hipatterns = require("config.utils.hipatterns")
local move = require("config.utils.move")
local indentscope = require("config.utils.indentscope")
local bracketed = require("config.utils.bracketed")
local animate = require("config.utils.animate")

local default_event = require("config.event").default

local M = {
  {
    "echasnovski/mini.splitjoin",
    enabled = enable.splitjoin,
    event = default_event,
    config = true,
  },
  {
    "echasnovski/mini.comment",
    enabled = enable.comment,
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
  {
    "echasnovski/mini.animate",
    enabled = enable.animate,
    event = default_event,
    config = animate.config,
  },
  {
    "echasnovski/mini.hipatterns",
    enabled = enable.hipatterns,
    event = default_event,
    config = hipatterns.config,
  },
  {
    "echasnovski/mini.icons",
    opts = icons.opts,
    lazy = true,
    specs = icons.specs,
    init = icons.init,
  },
}

return M
