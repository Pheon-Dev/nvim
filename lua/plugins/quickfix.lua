local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "kevinhwang91/nvim-bqf",
    enabled = enable.bqf,
    event = default_event,
    dependencies = require("config.quickfix").dependencies,
    config = require("config.quickfix").config,
  },
}

return M
