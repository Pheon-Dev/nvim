local enable = require("config").enable

local supermaven = require("config.ai.supermaven")

local insert_enter_event = require("config.event").enter.insert
local default_event = require("config.event").default
local lazy_event = require("config.event").lazy

local M = {
  {
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = false,
  },
  {
    "supermaven-inc/supermaven-nvim",
    build = supermaven.build,
    event = insert_enter_event,
    enabled = enable.supermaven,
    keys = supermaven.keys,
    -- opts = supermaven.opts,
    config = supermaven.config,
  },
}

return M
