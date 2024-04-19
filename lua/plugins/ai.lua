local enable = require("config").enable

local neocodeium = require("config.ai.neocodeium")

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy
local insert_enter_event = require("config.event").enter.insert
local cmd_enter_event = require("config.event").enter.cmd

local M = {
  {
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = enable.codeium,
  },
  {
    "monkoose/neocodeium",
    event = lazy_event,
    enabled = enable.neocodeium,
    config = neocodeium.config,
  },
}

return M
