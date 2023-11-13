local enable = require("config").enable

local copilot = require("config.ai.copilot")
local cmp = require("config.ai.cmp")

local default_event = require("config.event").default
local attach_event = require("config.event").attach
local insert_enter_event = require("config.event").enter.insert

local M = {
  {
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = enable.codeium,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = copilot.cmd,
    event = insert_enter_event,
    enabled = enable.copilot,
    config = copilot.config,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = { insert_enter_event, attach_event },
    fix_pairs = true,
    enabled = enable.copilot_cmp,
    config = cmp.config,
  }
}

return M
