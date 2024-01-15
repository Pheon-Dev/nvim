local enable = require("config").enable

local diaglist = require("config.quickfix.diaglist")
local bqf = require("config.quickfix.bqf")

local default_event = require("config.event").default

local M = {
  {
    "onsails/diaglist.nvim",
    enabled = enable.diaglist,
    config = diaglist.config,
  },
  {
    "kevinhwang91/nvim-bqf",
    enabled = enable.bqf,
    event = default_event,
    dependencies = bqf.dependencies,
    config = bqf.config,
  },
}

return M
